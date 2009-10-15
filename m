From: tike64 at gmail.com <tike64@gmail.com>
Date: Thu, 15 Oct 2009 13:43:44 +0300
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <4AD6F907.6070106@mimc.co.uk>
References: <4AD6ED89.6020902@mimc.co.uk> <1255601357.3933.4.camel@sven>
	<4AD6F907.6070106@mimc.co.uk>
Message-ID: <4AD6FCE0.6080005@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark Jackson wrote:
> A sort of 'make install' which would:-
> 
> (a) delete the output/target contents
> (b) copy target_skeleton to output/target
> (c) run 'make install' on all selected packages (re-compiling if required)
> 
> I'd find that *most* useful !!

I would also find it useful but, while we are waiting it, this might be of some 
value:

rm -rf output/build/.root output/target `find -name *target_installed`

I know, that even after that, make will do a lot of unneeded rebuilding but 
maybe not as much...

--

Timo
