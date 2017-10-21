class GameScriptTarget
{
public:
	class ScriptEvents {
	public:
		static ScriptEvents * getInstance()
		{
			static ScriptEvents instance;
			return & instance;
		}

		static ScriptTarget::EventRegistry * getEventRegistry()
		{
			static ScriptTarget::EventRegistry registry;
			return & registry;
		}

		struct SCRIPT_EVENT_initialize
		{
			SCRIPT_EVENT_initialize()
			{
				_event = ScriptEvents::getRegistry()->addEvent("initialize","");
			}

			const ScriptTarget::Event * getEvent()
			{
				return _event;
			}

		private:
			const ScriptTarget::Event * _event;
		}

		SCRIPT_EVENT_initialize initialize;

	private:
		ScriptEvents() {}
	}
}


_scriptTarget->addScriptCallback(GameScriptTarget::ScriptEvents::getInstance()->initialize->getEvent(),"initialize");