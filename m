From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 10:10:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: bump version to 21.0
In-Reply-To: <87efh1m9pd.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 20 Jun 2018 23:25:50 +0200")
References: <20180620203343.15647-1-bernd.kuhls@t-online.de>
 <87efh1m9pd.fsf@dell.be.48ers.dk>
Message-ID: <87muvlj544.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> Release notes: http://www.erlang.org/news/123
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > Committed, thanks.

This causes a number of (pcre related?) build issues for the host
version. Care to take a look?

http://autobuild.buildroot.net/?reason=host-erlang-21.0

-- 
Bye, Peter Korsgaard
