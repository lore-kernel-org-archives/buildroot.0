From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Feb 2021 10:43:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: update project URL
In-Reply-To: <87v9axdjdm.fsf@dell.be.48ers.dk>
References: <20210212091138.27649-1-sebastien.szymanski@armadeus.com>
 <87v9axdjdm.fsf@dell.be.48ers.dk>
Message-ID: <83a9f7b4-15ad-aed6-6574-2ce278e9673b@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 2/12/21 11:13 PM, Peter Korsgaard wrote:
> 
> ERROR: x265_3.3.tar.gz has wrong md5 hash:
> ERROR: expected: 0c8c747b59b5411dea8cf557554636c1
> ERROR: got     : be6ea7a139b01fa6f2614d5c1197492d
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Either we need to change the hashes (and update the copy on
> sources.buildroot.org) or keep it as is until we bump the version.
> 

Arf :(
I have just send a v2 with hashes updated.

Thanks!

-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
