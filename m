From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:39:39 +0100
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.7.2
In-Reply-To: <55006EB3.6090100@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 11 Mar 2015 13:34:59 -0300")
References: <1426081428-32041-1-git-send-email-gustavo@zacarias.com.ar>
 <20150311143450.GG2177@tarshish> <550062B5.2080000@zacarias.com.ar>
 <55006EB3.6090100@zacarias.com.ar>
Message-ID: <87twxrlc8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 03/11/2015 12:43 PM, Gustavo Zacarias wrote:
 >>> That's disappointing. Upstream actually merged this patch (commit 
 >>> 157330dcac5), but another commit (ee3296275f) broke it in another way. Is it 
 >>> possible to pass --with-libnl=/dev/null so that ${incdir} and ${libnldir} 
 >>> point to a non-existing place? That should allow removing this patch.
 >> 
 >> Hi Baruch.
 >> I did find it odd as well, in fact missing CVE patches in the release
 >> made me twitch a little as well.
 >> I'll give it a shot.
 >> Regards.

 > Unfortunately it takes /dev/null at face value (meaning "no" or
 > "without") hence it doesn't include libnl support :-/
 > Regards.

Ok :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
