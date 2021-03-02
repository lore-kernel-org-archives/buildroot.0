From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 2 Mar 2021 18:01:41 +0100
Subject: [Buildroot] [PATCH] package/python-aioblescan: Bump to version
 0.2.7
In-Reply-To: <87blc2o9g6.fsf@dell.be.48ers.dk>
References: <20210225134802.257199-1-grzegorz@blach.pl>
 <87blc2o9g6.fsf@dell.be.48ers.dk>
Message-ID: <8df6aa9e-5c50-6f92-9a5f-17d759bc5a78@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2021 22:22, Peter Korsgaard wrote:
>>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:
> 
>   > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> 
> What is the upstream status of the patch? You don't mention it in your
> commit message.

At time when I wrote my patch the bug was not fixed upstream yet,
but now it is. So I've just sent update with patch fetched from upstream.

> Also use the -N option to git format-patch as pointed out by
> check-package:
> 
> package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch:4: generate your patches with 'git format-patch -N'
> 
