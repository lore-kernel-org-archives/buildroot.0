From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 10:42:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version
 5.3.1
In-Reply-To: <20200326100404.82191-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 26 Mar 2020 04:04:04 -0600")
References: <20200326100404.82191-1-james.hilliard1@gmail.com>
Message-ID: <87eet6b7nq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Can you please mention whenever version bumps have security
implications? E.G. looking at the 5.3.1 release the only change is:

#386: Prevents arbitrary code execution during python/object/new
 constructor

https://github.com/yaml/pyyaml/pull/386

Which sounds very much like a security bump to me.

-- 
Bye, Peter Korsgaard
