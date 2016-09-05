From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Sep 2016 15:53:58 +0100
Subject: [Buildroot] [PATCH 6/6] e2fsprogs: bump version to 1.43.2
In-Reply-To: <20160905134709.zhnxsqxlloocqvjc@tarshish>
References: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
 <1473082812-690-6-git-send-email-Vincent.Riera@imgtec.com>
 <20160905134709.zhnxsqxlloocqvjc@tarshish>
Message-ID: <3f512f01-398f-33f2-c7b3-4e6d4fcfc922@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

thanks for spotting my mistake. I've sent a v2 for that patch:

http://patchwork.ozlabs.org/patch/665875/

Regards,

Vincent.

On 05/09/16 14:47, Baruch Siach wrote:
> Hi Vincente,
> 
> On Mon, Sep 05, 2016 at 02:40:12PM +0100, Vicente Olivert Riera wrote:
>> Upstream patches removed.
> 
> Is autoreconf still needed? It was introduced with cd48a7e572a (e2fsprogs: fix 
> build failure with old glibc versions) for the librt patch that this patch 
> removes.
> 
> baruch
> 
