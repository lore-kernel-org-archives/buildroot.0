From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 18 Jan 2014 17:00:34 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <CAEYzJUEM2FDufa-EPLpu6B6Eiyp9Xg-S5qsg8TCQ5X75hVDVxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 December 2013 17:31, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> Buildroot fails to run on NixOS because it has no /bin/echo or
> /bin/grep. Instead of relying on absolute paths, rely on tools to be
> available in PATH. This should work for all systems.

Ping?

When this is applied, make sure to also apply "[PATCH 2/2] Prefer
'printf' over 'echo -e' (for portability)".

Best regards,
Bj?rn Forsman
