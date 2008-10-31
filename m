From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 31 Oct 2008 13:36:01 -0400
Subject: [Buildroot] my first patch !
In-Reply-To: <20081031171037.GF27517@mx.loc>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAIMsuCDiF8RCojvQ+E2NNJQBAAAAAA==@cimeq.qc.ca>
	<20081031171037.GF27517@mx.loc>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJ/gkkvS7oNNlXjUFHIJdO4BAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to thanks you for your input. 

I would like to know what I suppose to do with thoses 3 files ?

I should remove all my "old" files in the package/netsnmp directory and put
this 3 files in there ?

I'm little new with all that patch, configs.. ect. 

Jonathan


-----Message d'origine-----
De?: Bernhard Reutner-Fischer [mailto:rep.dot.nop at gmail.com] 
Envoy??: 31 octobre 2008 13:11
??: Jonathan Dumaresq
Cc?: buildroot at uclibc.org
Objet?: Re: [Buildroot] my first patch !

On Fri, Oct 31, 2008 at 11:05:58AM -0400, Jonathan Dumaresq wrote:
>Hi all,
>
>I have a small patch for net-snmp to add the avr32 build to the machine
>availability. 
>
>This is the first patch that I make. So if I need to modify the way of
doing
>it, please let me know. 

Hi and welcome.
The gnuconfig stuff is handled a bit differently, see CONFIG_UPDATE

To spare you sime time, svn carries a way outdated netsnmp package, let
me point you to
http://repo.or.cz/w/buildroot.git?a=tree;f=package/netsnmp;hb=HEAD
respectively it's history.

HTH,
>
>Index: net-snmp-5.1.2/config.sub
>===================================================================
>--- net-snmp-5.1.2.orig/config.sub      2008-10-31 10:26:47.000000000 -0400
>+++ net-snmp-5.1.2/config.sub   2008-10-31 10:28:27.000000000 -0400
>@@ -228,7 +228,7 @@
>        | a29k \
>        | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
>        | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
>alpha64pca5[67] \
>-       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
avr
>\
>+       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
avr
>| avr32 \
>        | clipper \
>        | d10v | d30v | dlx | dsp16xx \
>        | fr30 | frv \
>
>Jonathan

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
