From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 25 Feb 2016 10:38:19 -0500
Subject: [Buildroot] Confusion about location of custom Linux patches
In-Reply-To: <56CE2E2F.6060809@mind.be>
References: <CAF_dkJA2VYCaAMTY=D3zsdV6YcAa1FS2w+8A2ygqrCuqQFWfCQ@mail.gmail.com>
 <56CE2E2F.6060809@mind.be>
Message-ID: <CAF_dkJCtx0KgANq7vqB9NZ4vb9c1u6xWnExsk2QL4pzR_t5u_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 24, 2016 at 5:26 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/24/16 20:56, Patrick Doyle wrote:
>> I tried deciding that BR2_GLOBAL_PATCH_DIR was preferred, but now I'm
>> not sure how to name the subdirectory inside BR2_GLOBAL_PATCH_DIR.  I
>> have tried $BR2_GLOBAL_PATCH_DIR/kernel and
>> $BR2_GLOBAL_PATCH_DIR/linux, and neither has seemed to work.
>
>  linux is right. You must have done something else wrong. Do the file names end
> with .patch?

OK, it seems to work now.  I must have misspelled something
previously.  Thank you for your help.

--wpd
