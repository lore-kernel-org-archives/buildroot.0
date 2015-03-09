From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Mar 2015 22:20:54 +0100
Subject: [Buildroot] [PATCH 1/1 v2] eudev: fix dependency on kernel
 headers version
In-Reply-To: <54FD85C7.6040609@gmail.com>
References: <1425899411-30086-1-git-send-email-swexru@gmail.com>
 <20150309111733.GH2518@tarshish> <54FD85C7.6040609@gmail.com>
Message-ID: <54FE0EB6.4090801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/15 12:36, Alexey Mednyy wrote:
> sorry need more experience with git.
> git reset --soft HEAD~1
> gives files both in Changes to be commited and Changes not staged for
> commit.
> Now I know need to git add those files again.

 You want to use 'git commit --amend'.

 Regards,
 Arnout

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
