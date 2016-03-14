From: Steve Calfee <stevecalfee@gmail.com>
Date: Sun, 13 Mar 2016 22:14:57 -0700
Subject: [Buildroot] Another lame user question.
Message-ID: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, as the title says, I have another user question. I did explore
google and the buildroot docs.

I am trying to move the mysql directories to my writeable ubi
partition. Somewhere someone create the mysql user. Where did it get
created? However, there is no mysql group. I cannot get mysql to start
from a ubi partition mounted at /data/mysql. Who and where is the
mysql user created (some files have that as a user)

The buildroot manual documents the makeusers syntax, but what file do
I create where? Will that work for mysql?

Thanks, Steve
