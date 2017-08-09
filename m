From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 9 Aug 2017 09:53:00 -0700
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <93435a55-386a-c2df-abb2-8ed7e496d7f1@mind.be>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
 <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
 <CAJJ6jxs0YL9hEumc5xwLYdTU0d6iM3CVtSyLiAMVM_9U0S1Erg@mail.gmail.com>
 <669d2c84-8015-74fe-7c74-54f5101c6891@mind.be>
 <CAJJ6jxutio48UzYa_bK-CRc7t834Ds16+05+bO5EKfnrQL1tgA@mail.gmail.com>
 <93435a55-386a-c2df-abb2-8ed7e496d7f1@mind.be>
Message-ID: <CAJJ6jxswe=VjkprMGi92M+KhYn427rJiHQ-APCKQ5BxDLxPjrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Weird, when I ran make oracle-mysql-reconfigure then mysql_safe was
installed!. So then I did a make clean and make -- this time
mysql_safe was installed.

I am pretty sure I did a make clean earlier before I found this
problem, but maybe not. I am not sure what a dirty build would affect
in mysql server, but something messed up my build. Now it seems to be
normal.

Thanks for the help, Steve
