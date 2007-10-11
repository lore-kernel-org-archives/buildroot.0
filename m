From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Thu, 11 Oct 2007 16:17:31 +0000 (GMT)
Subject: [Buildroot] python on embedded system
Message-ID: <931048.37830.qm@web26215.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,



I'd like to reduce python and just compile this modules:

Modulo 59 Nota Tecnica Rev.2 Data 01/03   	  	 	 	 	 	 	 	 <!--  _filtered {margin:0.79in;} P {margin-bottom:0.08in;} -->   _main_

    _buildin_

    marshal

 	    imp

 	    sys

 	    os

 	    float

    md5

 	    socket

 	    asyncore

 	    select

 	    thread

 	    threading

 	    time

 	    termios
 
I set up the PYTHON_DISABLE_MODULES with _PYTHON_DISABLED_MODULES=readline pyexpat dbm gdbm bsddb \

        _curses _curses_panel _tkinter nis zipfile _codecsmodule \

        cryptmodule _randommodule grpmodule regexmodule parsermodule \

        dbmodule glmodule pwdmodule gcmodule rgbimgmodule _heapqmodule \

        imageop cPickle audioop multybytecodec



and using the buildroot patch that disable modules. At the and I having a 12 Mb of stuff. I don't understand how to avoid the installation of a lot

of not useful py file. It is possible to reduce the size of python enviroment?



Regards Michael







      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
