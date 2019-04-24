From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:25:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.11
In-Reply-To: <20190414223529.3694-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Apr 2019 00:35:29 +0200")
References: <20190414223529.3694-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhof6tgw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix a bug where cJSON_Minify could overflow it's buffer, both reading
 > and writing: https://github.com/DaveGamble/cJSON/issues/338.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
