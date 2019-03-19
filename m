From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:15:28 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/flashrom: remove dmidecode
 dependency
In-Reply-To: <20190228192613.30160-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Feb 2019 20:26:08 +0100")
References: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
Message-ID: <87va0ehe0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > flashrom uses its own internal DMI decoder since version 0.9.8 and
 > https://github.com/flashrom/flashrom/commit/4c6d3a4b732732eb20bfb0fc9d857abaa4c41c88

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

These are all arguably bugfixes, so I've committed them to 2019.02.x -
Thanks.

-- 
Bye, Peter Korsgaard
