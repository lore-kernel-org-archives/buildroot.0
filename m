From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 19 Feb 2013 10:58:38 +0000
Subject: [Buildroot] [PATCH v2] vim: Add post-install hook to remove
 documentation from target
In-Reply-To: <20130212130828.22a0522e@skate>
References: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
 <20130212122323.276f018f@skate>
 <CAG2jQ8jzrz=fUPuqkjQTGfhWrcNCb-dZKSye=XQo3fmjoPvfUA@mail.gmail.com>
 <20130212130828.22a0522e@skate>
Message-ID: <CAG2jQ8jmNCBAbuZ1+uyCb4nVUamtketebQfNq-aeGyAcDo7s+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 February 2013 12:08, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Tue, 12 Feb 2013 11:59:16 +0000, Markos Chandras wrote:
>
>> I agree but seeing how the VIM_INSTALL_RUMTIME_CMDS is implemented, I
>> figured this was the recommended practice.
>> If you need me to submit a new patch please let me know.
>
> For me, the patch is fine as is, since it's a rule we haven't been
> enforcing everywhere.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Friendly reminder, just making sure this fix will be included in the
2013.02 release.

-- 
Regards,
Markos Chandras
