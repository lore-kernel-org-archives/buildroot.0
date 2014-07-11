From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 20:11:13 +0200
Subject: [Buildroot] autobuild-run update
In-Reply-To: <CAHkwnC9qytLwyvxAJ5Bkfc--1Cmh_Y9PY7Vq20OYYG1ErpRLDw@mail.gmail.com>
References: <20140708232244.39817a4c@free-electrons.com>
 <CAHkwnC9qytLwyvxAJ5Bkfc--1Cmh_Y9PY7Vq20OYYG1ErpRLDw@mail.gmail.com>
Message-ID: <20140711201113.3dc019a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 11 Jul 2014 18:36:36 +0200, Fabio Porcedda wrote:

> I'm trying to use it on a Ubuntu 14.04 but it fails in few seconds
> with this error:
> 
>  ./autobuild-run --ninstances 2 --njobs 3

[...]

> HTTPError: HTTP Error 404: Not Found

Aah, yes, my bad. I removed the AVR32 toolchain configuration file
yesterday, but forgot to remove this toolchain from the csv file that
describes all the available toolchain configurations.

This is now fixed, so the script should work again (and the Free
Electrons build server should start again doing some builds).

Thanks for the report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
