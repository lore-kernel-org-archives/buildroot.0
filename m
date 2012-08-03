From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Fri, 3 Aug 2012 07:32:07 -0700 (PDT)
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <20120803150651.6ce383f0@skate>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120802152640.5d9cca86@skate>
 <1343936315.31073.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <20120802214237.37ed2f82@skate>
 <1343944807.21046.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120803150651.6ce383f0@skate>
Message-ID: <1344004327.94147.YahooMailNeo@web164606.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, if I use "standard" Xorg or Qt I suppose, Free pascal compiler would know
(I suppose that is well known matter in linux - or am I wrong?). But not so sure 
if I use Tiny X (like I do- that's why I tried to built modular Xorg, but not succeeded).
Libraries, which compiler asks me for I put from built ones.
?
Best regards
?
PS I am also suspitious about final success, but I don't know if there is some way to
programm in some RAD GUI environment?(like Lazarus)?and do crosscompiling.


________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at uclibc.org" <buildroot@uclibc.org> 
Sent: Friday, August 3, 2012 3:06 PM
Subject: Re: [Buildroot] glibc instead of ulibc ?

Le Thu, 2 Aug 2012 15:00:07 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> Tricky part is command for compiling. I do that from IDE - in
> accordance with:
> http://wiki.freepascal.org/Setup_Cross_Compile_For_ARM. 

I'm not an expert in this thing, but it seems that those instructions
tell you to build a special ARM compiler for building the Freepascal
code. This looks wrong, as this special compiler doesn't now which C
library is being used on the target.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120803/9450efd0/attachment.html>
