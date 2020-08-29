From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 10:13:48 +0200
Subject: [Buildroot] Ruby support in Buildroot
Message-ID: <87pn79kgxv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Our ruby package could use some love. We have no DEVELOPERS entry for
it, and the package has only seen small (security) fixes since 2017 or
so:

https://git.buildroot.net/buildroot/log/package/ruby

We are currently using ruby 2.4.x, which has been EOL since April:

https://www.ruby-lang.org/en/news/2020/04/05/support-of-ruby-2-4-has-ended/

I personally do not have the time or interest to update and maintain
ruby, so unless someone steps up to support it I think the best solution
is to drop the package before 2021.02.

Anyone interested in helping support ruby?

-- 
Bye, Peter Korsgaard
