From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 18 Nov 2012 21:11:43 +0100
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <CAF-Ht3w505-MDPNBizt4EcWFC=rB9QH2-=eDrGbtn+-pxOf9TQ@mail.gmail.com>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
 <20121117123531.431cbd65@skate>
 <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
 <20121117130703.03beb6e1@skate>
 <CABYt4-ZRHdmbCAwtt8+swiwRHNwg=0_zEJxe7UnxetBgudXGKg@mail.gmail.com>
 <CAF-Ht3w505-MDPNBizt4EcWFC=rB9QH2-=eDrGbtn+-pxOf9TQ@mail.gmail.com>
Message-ID: <50A940FF.7000808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Juha,

ironically i just started to add board support to Buildroot for this 
board, it's not totally ready yet, it still needs some cleanup, and i 
also had to add config option to the mxs-bootlets package to enable 
custom patches, so i can't really send a patchset yet to the mainstream, 
but i uploaded it to gitorious, if you still want to play around with it 
then you can get it here:

https://gitorious.org/buildroot-olinuxino/buildroot-olinuxino

to build a kernel and a base root filesystem, clone the repository, and 
just follow the readme.txt:

https://gitorious.org/buildroot-olinuxino/buildroot-olinuxino/blobs/master/board/olinuxino/olinuxino-maxi/readme.txt

Any feedback is welcome, as i still need to test this before i make a 
patchset :)
Otherwise it seems everything is working well with the built image, but 
i cannot test the composite video output as i don't have
any TV kind of stuff here...


-- 
br,
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
