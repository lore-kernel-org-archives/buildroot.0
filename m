From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 19:53:12 +0200
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.14.1
In-Reply-To: <CACXmViZMDgUQMw+fWNiLbq+1QTXQgEYyhC0ughmWpmLVOz+WQg@mail.gmail.com>
 (Peter Korsgaard's message of "Wed, 4 Sep 2019 21:44:08 +0200")
References: <20190904005128.5720-1-sergio.prado@e-labworks.com>
 <CACXmViZMDgUQMw+fWNiLbq+1QTXQgEYyhC0ughmWpmLVOz+WQg@mail.gmail.com>
Message-ID: <8736gu4xo7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On Wed, Sep 4, 2019 at 2:52 AM Sergio Prado <sergio.prado@e-labworks.com> wrote:
 >> 
 >> Since configure is using PKG_CHECK_MODULES macro, we need to
 >> unconditionally depends on host-pkgconf.
 >> 
 >> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Given that this just contains a minor fix, committed to 2019.08.x -
thanks.

-- 
Bye, Peter Korsgaard
