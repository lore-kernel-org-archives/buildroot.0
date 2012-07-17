From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Jul 2012 11:43:58 +0200
Subject: [Buildroot] [PATCH v5 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <20120717111703.3adbb357@skate>
References: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
 <1342474650-10084-2-git-send-email-s.martin49@gmail.com>
 <20120717111703.3adbb357@skate>
Message-ID: <CAHXCMMK8_vif95DakvjAhV8RGmS=SLFuR1C=FoZLDFGn_oSDCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 16 Jul 2012 23:37:26 +0200,
> Samuel Martin <s.martin49@gmail.com> a ?crit :
>
>> Selecting the target subarchitecture variant automatically selects the
>> appropriated set of features.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Applied, after removing the depends on, and the SSE41/SSE42 options
> that were unused. The other 4 patches were also applied, with no
> changes.
arf!... SSE41/SSE42 options are useb by the opencv patch that has just
been merged.

-- 
Sam
