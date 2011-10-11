From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Oct 2011 13:50:45 +0200
Subject: [Buildroot] [git commit] neon: cleanup
In-Reply-To: <201110110635.45321.minimod@morethan.org> (Michael S. Zick's
 message of "Tue, 11 Oct 2011 06:35:43 -0500")
References: <20111011075632.11D3A8E2F8@busybox.osuosl.org>
 <201110110635.45321.minimod@morethan.org>
Message-ID: <87r52jagru.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> On Tue October 11 2011, Peter Korsgaard wrote:
 >> #############################################################
 >> -NEON_VERSION:=0.29.6
 >> -NEON_SITE:=http://www.webdav.org/neon/
 >> -NEON_INSTALL_STAGING:=YES
 >> -NEON_CONF_OPT:=--without-gssapi --disable-rpath
 >> +NEON_VERSION= 0.29.6
 >> 

 Michael> Shouldn't there be one more space in the above to be consistent?

Indeed. Will fix, thanks.

-- 
Bye, Peter Korsgaard
