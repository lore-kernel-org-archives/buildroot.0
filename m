From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:21:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version
 5.3.1
In-Reply-To: <87eet6b7nq.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 02 Apr 2020 10:42:33 +0200")
References: <20200326100404.82191-1-james.hilliard1@gmail.com>
 <87eet6b7nq.fsf@dell.be.48ers.dk>
Message-ID: <878sj7p35x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 > Can you please mention whenever version bumps have security
 > implications? E.G. looking at the 5.3.1 release the only change is:

 > #386: Prevents arbitrary code execution during python/object/new
 >  constructor

 > https://github.com/yaml/pyyaml/pull/386

 > Which sounds very much like a security bump to me.

Committed to 2020.02.x after adding that information, thanks.

I didn't backport it to 2019.02.x / 2019.11.x yet, as we need to ensure
it doesn't break the version checks in docker-compose.

-- 
Bye, Peter Korsgaard
