From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 18:06:29 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
In-Reply-To: <op.v26yjsdz705kjs@rico>
References: <add libfcgi to buildroot> <201110012259.10267.arnout@mind.be>
 <op.v26yjsdz705kjs@rico>
Message-ID: <201110111806.30216.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 11 October 2011 16:29:42, Rico Bachmann wrote:
> Here is the output form buildroot while using the patch:
> 
>        >>> fcgi 2.4.0 Patching packages/fcgi
>        for file in config.guess config.cub; do for i $(find
> /buildroot/output/build/fcgi-2.4.0 -name $file);
>        do cp package/gnuconfig/$file $i;
>        done; done

 Weird, you should get
>>> fcgi 2.4.0  Updating config.sub and config.guess
before the 'for'.

 And of course, you should get 
Applying fcgi-2.4.0-add-lm.patch using plaintext: 
before that one.

 That file does exist in the package/fcgi directory, right?  It's not that the 
patch ended up in a completely different place?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111011/f2cde576/attachment.html>
