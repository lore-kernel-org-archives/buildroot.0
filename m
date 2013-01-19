From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 17:16:44 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
Message-ID: <50FAC6EC.8030807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/13 02:12, Przemyslaw Wrzos wrote:
> Hi,
>
> I?d like to get some feedback on a feature I?d like to contribute to the
> buildroot project. I?m not quite sure what the process is so I thought
> I?d start on the mailing list.
>
> PROPOSAL:  Allow a directory (containing the source tree) to be used as
> the source for the kernel build. The source isn?t copied to the output
> directory but instead the kernel?s outputmakfile wrapper facility is used.
>

  A patch with similar functionality was posted in August by Sonic Zhang:

http://patchwork.ozlabs.org/patch/177618/

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
