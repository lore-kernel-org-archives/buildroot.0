From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Nov 2018 08:13:17 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <568b0b64-9f19-9aa7-a3bc-86863e2c9b91@mind.be> (Arnout
 Vandecappelle's message of "Wed, 21 Nov 2018 00:47:31 +0100")
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com> <20181113210216.37879bd4@windsurf>
 <20181113202946.GH10271@scaer>
 <016ed0ed-6489-2fa0-a32e-9f2a6918af01@mind.be>
 <20181115190558.GM10271@scaer> <20181116093513.152dc10c@windsurf>
 <20181120185005.GE2601@scaer>
 <568b0b64-9f19-9aa7-a3bc-86863e2c9b91@mind.be>
Message-ID: <87bm6ioqcy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  BTW, turns out that https://github.com/mikemccabe/tarsump is not usable - it
 > doesn't sort the files, and it doesn't compute an overall hash.

Isn't that just a question of piping the output to:

LANG=C sort | sha256sum

Or am I missing something?

-- 
Bye, Peter Korsgaard
