From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 12:43:49 -0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.7.2
In-Reply-To: <20150311143450.GG2177@tarshish>
References: <1426081428-32041-1-git-send-email-gustavo@zacarias.com.ar>
 <20150311143450.GG2177@tarshish>
Message-ID: <550062B5.2080000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 11:34 AM, Baruch Siach wrote:

> Hi Gustavo,
> 
> That's disappointing. Upstream actually merged this patch (commit 
> 157330dcac5), but another commit (ee3296275f) broke it in another way. Is it 
> possible to pass --with-libnl=/dev/null so that ${incdir} and ${libnldir} 
> point to a non-existing place? That should allow removing this patch.

Hi Baruch.
I did find it odd as well, in fact missing CVE patches in the release
made me twitch a little as well.
I'll give it a shot.
Regards.
