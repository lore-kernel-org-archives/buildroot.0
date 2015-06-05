From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 14:01:56 +0200
Subject: [Buildroot] [PATCH 03/12] fs/iso9660: use if ... endif block
 instead of depends on
In-Reply-To: <1433430330-2166-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJowV3BWw65oFe2uAcer1gsOZOvicQFc2mJnB5fNQtx+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> In preparation to the addition of numerous additional options to the
> iso9660 filesystem logic, use a if ... endif block instead of a
> depends on for the only option that currently exists.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
