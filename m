From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 20:29:17 +0100
Subject: [Buildroot] [PATCH v3] moarvm: disable for sparc64
In-Reply-To: <20160117173304.GA5921@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sun, 17 Jan 2016 18:33:04 +0100")
References: <20160117173304.GA5921@waldemar-brodkorb.de>
Message-ID: <871t9e7kky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Missing implementation of AO_fetch_compare_and_swap in
 > libatomic_ops library for sparcv9.

You dropped the autobuilder references you had in v1. Committed with
those added back in the commit message, thanks.

-- 
Bye, Peter Korsgaard
