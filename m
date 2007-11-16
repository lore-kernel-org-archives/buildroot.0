From: Privat <zentrale.at.work@gmail.com>
Date: Fri, 16 Nov 2007 10:25:17 +0100
Subject: [Buildroot] Gettext / GLib headers in target
In-Reply-To: <473D523C.10206@Kriegisch.name>
References: <473D4CAD.4070008@googlemail.com> <473D523C.10206@Kriegisch.name>
Message-ID: <473D61FD.5040900@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander Kriegisch schrieb:
>> Would it be possible have the gettext and header in the target to be 
>> able to build tools using the natively?
> 
> I do not understand your English, I am afraid. Maybe you can explain
> again (differently) or just add a German version of your question so at
> least some people understand what you want to know.

English:
Sure. I'm using a BR-created Root-FS with a native toolchain. Using this 
native toolchain, i would need to be able to build some packages that 
rely on the gettext and glib libraries. As far as i can see, the 
respective header files are not copied to the target file system. Is 
there a way to have this automated, or is the only solution at the 
moment copying the files by hand?

Deutsch:
Gerne! Ich benutze ein Root-FS, das mittels BR erzeugt wird und eine 
native Toolchain beinhaltet. Mittels dieser Toolchain m?chte ich 
in-target einige Pakete kompilieren, die die gettext- und glib- 
Bibliotheken nutzen. Die damit notwendigen header files dieser beiden 
Bibliotheken werden allerdings von BR nicht ins target-filesystem 
kopiert, soweit ich das sehen kann. Kann dieser Vorgang automatisiert 
erfolgen, oder besteht im Moment die einzige L?sung darin, die Dateien 
von Hand "nachzukopieren"?

Best Regard / Viele Gr?sse

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at googlemail.com

watch out for:
www.rocksociety.de
