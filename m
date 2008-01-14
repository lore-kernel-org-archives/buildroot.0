From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 14 Jan 2008 11:23:06 -0500
Subject: [Buildroot] error messages
In-Reply-To: <00a601c85644$796a65c0$020514ac@atmel.com>
References: <00b501c853c9$4fc21330$6e00a8c0@JONATHAN>
	<00a601c85644$796a65c0$020514ac@atmel.com>
Message-ID: <01f101c856c9$be8ff5e0$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Ulf,

I'm not sure to what to do with your answer. 

On which file I should apply this patch ?

Regards

Jonathan

-----Message d'origine-----
De?: Ulf Samuelsson [mailto:ulf at atmel.com] 
Envoy??: 12 janvier 2008 12:10
??: Jonathan Dumaresq; buildroot at uclibc.org
Objet?: Re: [Buildroot] error messages

> Hi all,
> 
> 
> 
> I just use the defconfig of the rm9200 to setup a build process. 
> I go the error that you can find in the attached file. 
> Regards
> 
> Jonathan

Apply diffs when bzero is found.

-    bzero(msg, *len);
+    memset(msg, '\0', *len);Best Regards
Ulf Samuelsson
