From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Jan 2018 06:20:54 -0600
Subject: [Buildroot] [PATCH v3 2/8] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1341e9d3-f42a-2162-1f47-6cc2b53716a4@green-communications.fr>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1515557739-6027-2-git-send-email-matthew.weber@rockwellcollins.com>
 <1341e9d3-f42a-2162-1f47-6cc2b53716a4@green-communications.fr>
Message-ID: <CANQCQpZc4RMMmF0j5dHZVnSfAH2OV1ymHzCmy4jKXiyH2X0k0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas,

On Wed, Jan 10, 2018 at 2:22 AM, Nicolas Cavallari
<Nicolas.Cavallari@green-communications.fr> wrote:
> On 10/01/2018 05:15, Matt Weber wrote:
>> [...]
>> +config BR2_RELRO_NONE
>> +     bool "None"
>> +     help
>> +       Enables Relocation link-time protections.
>
> Disables ?
>
>> +config BR2_FORTIFY_SOURCE_NONE
>> +     bool "None"
>> +     help
>> +       Enables additional checks to detect buffer-overflows.
>
> And here too ?

Correct in both cases, oops.  I'll update in v4.

Thanks for the review!
Matt
