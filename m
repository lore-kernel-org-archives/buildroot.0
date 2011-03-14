From: Will Newton <will.newton@gmail.com>
Date: Mon, 14 Mar 2011 17:22:24 +0000
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <201103141154.45996.minimod@morethan.org>
References: <AANLkTikz08GZdkFc9kEVmk6mdxpnb_hovz1JpTXQ8zpa@mail.gmail.com>
	<201103141154.45996.minimod@morethan.org>
Message-ID: <AANLkTikuS1doYx310yhGbu6esBQAqksL_VzgKZRWfBH+@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 14, 2011 at 4:54 PM, Michael S. Zick <minimod@morethan.org> wrote:
> On Mon March 14 2011, Will Newton wrote:
>> NSS is the Network Security Services library developed as part of
>> the Mozilla project. It provides similar functions to OpenSSL but
>> allows MPL, GPL and LGPL licensing and has been FIPS certified.
>>
>
> Note:
> The version mentioned in this patch __is not__ one of the certified
> versions.
> Ref:
> http://www.mozilla.org/projects/security/pki/nss/fips/
>
> Nor does the validated version build for all of the Buildroot targets.
> Ref:
> http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140val-all.htm#815
> http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140sp/140sp815.pdf
>
> So I think it is unwise to include that "and has been FIPS certified"
> in the new package description.

I'm aware that it is not a FIPS certified version, I only that line in
there to help answer the inevitable "why another crypto library?"
question.

I'll remove the mention of FIPS certification.
