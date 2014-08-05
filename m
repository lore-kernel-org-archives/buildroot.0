From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 09:44:27 +0200
Subject: [Buildroot] [PATCH v10] espeak: new package
In-Reply-To: <53E08ABC.9070900@intelibre.fr>
References: <1398867713-3604-1-git-send-email-arnaud@intelibre.fr>
 <20140804224202.0eb57098@free-electrons.com>
 <53E08ABC.9070900@intelibre.fr>
Message-ID: <20140805094427.69605590@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud Aujon,

On Tue, 05 Aug 2014 09:41:48 +0200, Arnaud Aujon wrote:

> Thanks for applying !
> 
> I will have a look at the new upstream version shortly and send a patch 
> if needed.

You could also send a patch to fix
http://autobuild.buildroot.org/results/f39/f3903d2b4a16226df2d460dcd2e26c7fb87613ab/build-end.log.
Basically, espeak depends on thread support, so you'll have to change
the Config.in file to reflect that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
