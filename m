From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 2 Jun 2020 17:02:06 -0700
Subject: [Buildroot] procps-ng: disable for musl libc
Message-ID: <CAGt4E5sHuMNr38r_adE4Tj2+VmWevAYwyAN9_PSENem4prK0Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

There is a patch called "procps-ng: disable for musl libc" that was
applied to 2018.02.x:

https://patchwork.ozlabs.org/project/buildroot/patch/3f2a94307e6c380842726b8158e8ec2e9d24372a.1530616293.git.baruch at tkos.co.il/

This patch does not seem to be in any of the following releases nor is
it in master.

$ for i in 2018 2019 2020; do for j in 02 05 08 11;do echo "$i/$j";
git log origin/$i.$j.x | grep 'procps-ng: disable for musl libc';
done;done
2018/02
    procps-ng: disable for musl libc
2018/05
2018/08
2018/11
2019/02
2019/05
2019/08
2019/11
2020/02

Is this on purpose or should this patch be applied to all releases
going forward?

Thanks,
-Markus
