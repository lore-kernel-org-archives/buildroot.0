From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:27:48 +0100
Subject: [Buildroot] [PATCH v3 1/7] genrandconfig: fix code style
In-Reply-To: <1520910585-19097-2-git-send-email-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Tue, 13 Mar 2018 00:09:39 -0300")
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-2-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <87efknk6nf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Fix these warnings:
 > E201 whitespace after '['
 > E202 whitespace before ']'
 > E501 line too long (138 > 132 characters)
 -> isolate the common part of the external toolchain url in a variable
 >  to make the long lines shorter and more readable.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes v2 -> v3:
 >   - no changes

Committed, thanks.

-- 
Bye, Peter Korsgaard
