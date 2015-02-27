From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 Feb 2015 17:51:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-26
In-Reply-To: <20150227073017.514B51016A5@stock.ovh.net>
References: <20150227073017.514B51016A5@stock.ovh.net>
Message-ID: <54F0A0A6.5000404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,


On 27/02/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-02-26
> ===============================
>       mipsel |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/dca03ab0a9d63b0de72bdd80564166d85cdec0ca/

I have reported this upstream:

  https://github.com/zeromq/czmq/issues/944

>     mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/5b9b53a37f7cf4bab4d989f852726a0f0885605f/

I have sent a patch to fix this:

  https://patchwork.ozlabs.org/patch/444338/

Regards,
--
Vincent
