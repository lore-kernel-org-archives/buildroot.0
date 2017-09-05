From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 12:33:56 +0200
Subject: [Buildroot] Orange Pi HDMI to VGA output
In-Reply-To: <20170905094103.GA5082@airbook.vandijck-laurijssen.be> (Kurt Van
 Dijck's message of "Tue, 5 Sep 2017 11:41:03 +0200")
References: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
 <878thum8u8.fsf@dell.be.48ers.dk>
 <20170905094103.GA5082@airbook.vandijck-laurijssen.be>
Message-ID: <874lshmo2z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

Hi,

 > My experience with HDMI to VGA convertors, on a beaglebone:

 > an "HDMI to VGA" convertor needs power.
 > An HDMI port provides, per spec, up to 10mA or so.
 > So, if you're using such HDMI to VGA convertor:
 > The beaglebone has a polyfuse to enforce this current limit.
 > Then the HDMI to VGA will never actually power up and fail to
 > emit VGA signal.
 > I once managed to succeed here with bypassing the polyfuse with a wire.

Alternatively, the HDMI-to-VGA adapters I've seen typically can be
powered through USB (sometimes not exposed on the outside though).

-- 
Bye, Peter Korsgaard
