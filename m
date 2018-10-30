From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:04:59 +0100
Subject: [Buildroot] [PATCH 1/2] lighttpd: security bump to version
 1.14.51
In-Reply-To: <20181030102152.9755-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Oct 2018 11:21:51 +0100")
References: <20181030102152.9755-1-peter@korsgaard.com>
Message-ID: <87k1lzdwus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > 1.4.50:
 > [mod_alias] security: potential path traversal with specific configs
 > [core] security: use-after-free invalid Range req
 > [mod_alias] security: path traversal in mod_alias (in some use cases) (fixes #2898)
 > [core] security: use-after-free after invalid Range request (fixes #2899)

 > 1.4.51:
 > [core,security] process headers after combining folded headers
 > [mod_userdir] security: skip username ?.? and ?..?

 > 1.4.51 brings optional pam and wolfssl support.  Explicitly disable these
 > options for now.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
