From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 09:27:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-12-16
In-Reply-To: <e74aed1a-dec1-7774-2739-7d7c7f2ed999@mind.be> (Arnout
 Vandecappelle's message of "Tue, 18 Dec 2018 00:43:07 +0100")
References: <20181217070031.7A1922072F@mail.bootlin.com>
 <875zvs4lwp.fsf@dell.be.48ers.dk> <20181217090810.18bfe9d0@windsurf>
 <871s6g4l29.fsf@dell.be.48ers.dk>
 <e74aed1a-dec1-7774-2739-7d7c7f2ed999@mind.be>
Message-ID: <877eg72qa3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >> swupdate uses $CROSS-cc and not $CROSS-gcc, which not all external
 >> >> toolchain have. I think it makes sense to add a cc -> gcc symlink for
 >> >> external toolchains we download if not present. We cannot really do it
 >> >> for pre-installed external toolchains as we might not have write access
 >> >> to them.

>  So the symlink is then not a good solution IMO.

Well, you can argue that an externally installed toolchain isn't our
responsibility. Buildroot does the right thing if a symlink is added
(externally to BR) to such a toolchain.

-- 
Bye, Peter Korsgaard
