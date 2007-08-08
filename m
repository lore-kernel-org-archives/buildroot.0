From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 07 Aug 2007 20:10:51 -0400
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <12044831.post@talk.nabble.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>	<12028348.post@talk.nabble.com>	<46B860B5.8050205@mainstreetsoftworks.com>	<20070807122139.GA6430@real.realitydiluted.com>
	<12044831.post@talk.nabble.com>
Message-ID: <46B90A0B.60409@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  I tried Make libxml2-clean, make libxml2-dirclean & then make libxml2 but
> still xml-config was not copied. but when tried make libxml2-headers it
> copied xml-config properly. dont know why. anyway thanks for all your help. 
> 
>   Hope someone can help me like this with glib libintl issue .

Odd, still can't reproduce...
It looks like Ulf committed the libxml2 patch, so you might try to
update your svn and see if it works there...

I just did

make libxml2-clean
make libxml2-dirclean
make libxml2

Tried it with both the headers option on and off ...
Maybe you're svn is out of sync somehow, not really sure...
I'd probably need to see more of your debug output (where your <snip>'s
were in the original e-mail).

-Brad
