From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 26 Feb 2013 10:44:39 +0100
Subject: [Buildroot] [PATCH 02/11] manual: minor fix in patch-policy.txt
In-Reply-To: <20130226092907.48b09b41@skate>
References: <cover.1361827174.git.s.martin49@gmail.com>
 <677f6fbb5a9c1994131975c171a285c4335c38d8.1361827174.git.s.martin49@gmail.com>
 <20130226092907.48b09b41@skate>
Message-ID: <CAHXCMMKCb9fPS_Umqd8WMAKN66sQO4_=sujqX1ms0H+djLmLBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/2/26 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Mon, 25 Feb 2013 22:31:22 +0100, Samuel Martin wrote:
>
>> +- If a patch does some package version fixes, this should be documented in the
>> +commit message of the patch itself (or the message prepended to the 'diff'
>> +itself).
>
> I am not sure to understand this part.
I don't know how to explain this clearly.

My point is, for some packages, BR does not provide the latest version,
but some fix may be available upstream, so they have been backported in BR
(e.g.: package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch).

Any suggestion to explain this point in a better way is welcome.

>
>> +* Otherwise, patch files matching +<packagename>-<description>.patch+
>> +  are applied following the +ls+ command order.
>
> Shouldn't we be enforcing a <packagename>-<number>-<description>.patch
> policy, in order to ensure that patches are applied in the right order?
Well, here I stick to the current apply-patches.sh implementation.

Regards,

-- 
Samuel
