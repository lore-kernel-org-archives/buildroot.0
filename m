From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri, 5 Oct 2018 13:40:43 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2018-10-04
In-Reply-To: <20181005060013.AB6F8208F4@mail.bootlin.com>
References: <20181005060013.AB6F8208F4@mail.bootlin.com>
Message-ID: <672b4aebc97687da7302dbfd3b8d571b1845d05c.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter, Arnout,

On Fri, 2018-10-05 at 08:00 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-10-04, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your architectures:
> 
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_c039b85668e5b82b52a6dbffc90b863ddeef5cc7&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=j8jhQ7y0j__Px7TUngVu_UI2PsSeGgZrReTysGi9Lhs&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_5eecab649d9c619ddf466f78591d8b8933b6fd47&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=ZdtPr7qoj5tpiIHxvZ3_wP04wfxOnVNoDHp83MOXIYU&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_2a799563a8f10eba9a4d52c1d12066e642affbef&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=IlZyj2bq04B2EqY8gWMzd4fQZ9hz6ZA4YlPZ2BKKdIY&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_e2e9023a02d9785310e35fa7ca8aa1323e0b4133&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=2hg79ET_3fQK7enRXtE6Yughb5Bl2Xkl6oQR0zr8HuY&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_5bda5bcf576440037d830997f9fa7f6046aa8444&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=Rj5CthID3ZkFLARmMrLCmC50rBALe2aG7oRmn-i_8tE&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_df52f8b1e2a405e223a6bc1c3b805d1e76dbd69c&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=83hhdUf5-jAeUOKS1Ed262t7bbQva2rQF8vZDMUv_kg&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_1a39e67b1aac9d28c4bdd86a8af4963e8cd43ab6&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=TFB-mkgW_4uNJgIbkCtRC4RViqP1qkmzn6i9D-QCMkk&e=
>          arc |                 blktrace-1.2.0 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_dddc6f855a472610d97734290f260ae0c7e829e4&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=cxLlKg4r55CVFOiNQ_y6lR0_hQCFQj2ZThyCUXmh630&e=
>          arc |                  lvm2-2.02.180 | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_e7c83329601bba4c5e12160f67d287624dad6766&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=NFdcJH937qZp427JPZQ9YmUOpajFsrcULr2fkxnWJMI&s=VgXHnQhH3bRR80BF0yG3_pDqN1sW2YM5IhZErQYkQRQ&e=


I guess these failures should be fixed by https://patchwork.ozlabs.org/patch/976301/

-Alexey
