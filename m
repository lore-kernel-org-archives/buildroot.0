From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Wed, 16 Sep 2020 07:59:10 +0200
Subject: [Buildroot] [PATCH v2 12/12] package/s390-tools: new package
In-Reply-To: <752a61a6-a365-8e88-ef7c-080beb239c6c@gmail.com>
References: <20200913113254.1955447-1-egorenar@linux.ibm.com>
 <20200913113254.1955447-13-egorenar@linux.ibm.com>
 <752a61a6-a365-8e88-ef7c-080beb239c6c@gmail.com>
Message-ID: <87een25kk1.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain Naour <romain.naour@gmail.com> writes:


> glibc toolchain already depend on threads support, non static and wchar
>
> https://git.buildroot.net/buildroot/tree/toolchain/Config.in#n10
>
> Also glibc can't be selected for static only configuration (BR2_STATIC_LIBS set)
>
> https://git.buildroot.net/buildroot/tree/toolchain/toolchain-buildroot/Config.in#n43
>
> So only depends on BR2_TOOLCHAIN_USES_GLIBC is required.


Fixed.

Thank you
Regards
Alex
