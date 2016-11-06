From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 06 Nov 2016 21:17:07 -0200
Subject: [Buildroot] [PATCH 1/3] support/download/git: log checked out
 sha1
References: <6b271555-29d7-0b41-dd3f-698b2cd9724b@mind.be>
Message-ID: <581fb9f36306e_35c13fe67694009c9518c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thank you for reviewing this series.

On Sat, Nov 05, 2016 at 07:50 PM, Arnout Vandecappelle wrote:

[snip]
>> +if [ -z ${verbose} ]; then
> 
>  It's quite weird to check that verbose is empty, but that's how the variable is
> defined... Perhaps s/verbose/quiet/ would be a good idea...

OK, makes sense. I can send a followup patch.

Regards,
Ricardo
