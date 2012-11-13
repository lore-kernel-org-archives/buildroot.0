From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 23:10:21 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <50A284A8.9070304@mind.be>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <50A284A8.9070304@mind.be>
Message-ID: <20121113231021.6995bd28@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 13 Nov 2012 18:34:32 +0100, Arnout Vandecappelle wrote:

>   Thomas, I think this should be fixed by adding libgomp to
> LIB_EXTERNAL_LIBS in ext-tool.mk.  Is that right?  Will that also
> work if libgomp doesn't exist?

Do we really need to be linked against libgomp? Under what conditions
does that happen? Can't we avoid that even if the toolchain has OpenMP
support?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
