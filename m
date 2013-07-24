From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 24 Jul 2013 14:48:04 +0100
Subject: [Buildroot] Failed building DirectFB
In-Reply-To: <CAAsE_uchPX7Bzbhd7NjkUe-Vyf-JwpeSj=pfsbpWm8bYZNNnjA@mail.gmail.com>
References: <20130724091011.GB11352@zuhnb712.ap.bm.net>
 <CAAXf6LXxkj=68rHGDt6yYnB5h4r7hT5JkV9fXhau3kAaDemQSg@mail.gmail.com>
 <20130724095703.GA391@zuhnb712.ap.bm.net> <51EFA6CD.9090005@imgtec.com>
 <CAAsE_uchPX7Bzbhd7NjkUe-Vyf-JwpeSj=pfsbpWm8bYZNNnjA@mail.gmail.com>
Message-ID: <51EFDB14.9020100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/13 14:34, Woody Wu wrote:
> What's the buildroot it refer to? It's older or newer than 2013.05?  Do
> you think I can modify the .mk file similar to what the patch did?  Thanks.
>

The complete change is this

http://git.buildroot.net/buildroot/commit/package/directfb?id=88378877273829c387f48a6c96959712b892856f

this change happened after 2013.05 was released. You should be able to 
modify your buildroot in a similar way.
