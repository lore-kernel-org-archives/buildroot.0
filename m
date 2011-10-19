From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2011 10:11:35 +0200
Subject: [Buildroot] Adding hashes to package recipes
In-Reply-To: <201110182339.00295.arnout@mind.be>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018192708.68b1ba88@skate>
 <bd3650393bb885ae632b4e1963278d3f@zacarias.com.ar>
 <201110182339.00295.arnout@mind.be>
Message-ID: <20111019101135.7bf470a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 23:38:59 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Size and hash should only change when you bump the version, and in
> that case you anyway download the new tar file for testing so it
> shouldn't be too hard to recompute the hash.  And of course, the hash
> should be the same regardless of which mirror it is downloaded from...

True, but what does it bring exactly ?

> > It could also be an option to completely disable it.
> 
>  Definitely!

Well, the check at runtime can be disabled, but the fact that there
will be hashes in all packages to update every time we bump a package
is not something that can be "disabled". I am not talking from an user
point of view, but from a maintenance point of view.

I think in the past we talked about that with Peter and our opinions
was that it wasn't worth it. Now, I guess that if there are
sufficiently convincing arguments, we can change our minds :)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
