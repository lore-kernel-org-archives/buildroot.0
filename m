From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 08:49:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.12
In-Reply-To: <20190517131436.12864-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 17 May 2019 15:14:36 +0200")
References: <20190517131436.12864-1-fontaine.fabrice@gmail.com>
Message-ID: <878sufw6mq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix infinite loop in cJSON_Minify (potential Denial of Service), see
 > https://github.com/DaveGamble/cJSON/issues/354

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
