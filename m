From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Jun 2015 10:27:13 -0500
Subject: [Buildroot] [PATCH v7 19/22] libsemanage: cleanup python use
 and license definition
In-Reply-To: <20150630163946.10cd746c@free-electrons.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-20-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150630163946.10cd746c@free-electrons.com>
Message-ID: <CANQCQpbSGvDWE83UcOQRUX7qQ=q5sutPc24y4o-qQiUn6EwMJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jun 30, 2015 at 9:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Tue,  2 Jun 2015 08:28:35 -0500, Clayton Shotwell wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> The original package supported python on target, now we just use
>> it as part of the host tools.  The license was also mis-assigned.
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>
>> ---
>> Changes v6 -> v7:
>>   - No changes
>
> I've applied this patch. However, it was lacking an addition in
> Config.in.legacy to handle the removal of the
> BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS option.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Much appreciated.  By the way, Clayton is out on vacation (hence slow
response to email traffic).


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
