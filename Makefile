install :translate_ui-hi.mo
install: lang translate_ui /usr/local/bin
	which gdialog>/dev/null 2>&1 || install gdialog /usr/local/bin
	ln -sf /usr/local/bin/translate_ui /usr/local/bin/ntranslate_ui
	install: translate_ui-hi.mo /usr/share/locale/hi/LC_MESSAGES/

      

	translate_ui.pot:translate_ui
	 xgettext -o translate_ui.pot -L Shell translate_ui
translate_ui-hi.mo: translate_ui-hi.po
	msgfmt -o translate_ui-hi.mo translate_ui-hi.po


clone:
git clone https://github.com/AmeerahKhan/Translator-IndianLanguage.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
