From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 23:25:25 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.22
In-Reply-To: <1464295281-20211-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 May 2016 17:41:21 -0300")
References: <1464295281-20211-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wpmg4im2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > Core: Integer Overflow in php_html_entities
 > Core: Integer underflow / arbitrary null write in fread/gzread
 > GD: imagescale out-of-bounds read
 > Intl: get_icu_value_internal out-of-bounds read

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
