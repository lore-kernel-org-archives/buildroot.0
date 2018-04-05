From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 5 Apr 2018 14:36:51 -0500
Subject: [Buildroot] [PATCH v5 4/7] package/clang: new package
In-Reply-To: <20180404163124.27934-5-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
 <20180404163124.27934-5-valentin.korenblit@smile.fr>
Message-ID: <CANQCQpbOvUSGm+GS5xDaDJ-WeqnjCiQDF=kWFb9mNpKyZXZ4xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Apr 4, 2018 at 11:31 AM, Valentin Korenblit
<valentin.korenblit@smile.fr> wrote:
> This patch provides Clang tools and libraries for the host and libclang
> for the target.
>
> Clang is needed to build libclc, which is also provided in a follup patch.
>

Unsure of interest but we've been looking at using this concept below
which depends on clang.  I'm still working on completing what the
integration looks like with the additional clang libraries but thanks
again for sending this patchset out!

https://github.com/google/fuzzer-test-suite/blob/master/tutorial/libFuzzerTutorial.md
