From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 15:03:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/ser2net: check for new config
 file format
In-Reply-To: <20200306232501.119626-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Fri, 6 Mar 2020 16:25:01 -0700")
References: <20200306232501.119626-1-james.hilliard1@gmail.com>
Message-ID: <87o8t7t04c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > When running ser2net it looks for config files in the legacy conf
 > format and the new yaml format so we need to allow either in the
 > sysv init script.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
