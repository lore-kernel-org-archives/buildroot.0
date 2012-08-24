From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 24 Aug 2012 16:31:38 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <20120824135323.654eb15b@skate>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
 <20120824135323.654eb15b@skate>
Message-ID: <CAAfyv37CS+Hss_-kfiv9tGZDTPpeiG-bzjyF5mqNdL61=PNupg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 24, 2012 at 1:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 24 Aug 2012 08:56:32 +0200,
> "Dirk Lohse" <d.lohse@meier-nt.de> a ?crit :
>
>> ssh/dropbear doesn't work without password (right?). I've created a
>> password for root and it works. If not - maybe there is another
>> problem. When target-fs is mounted read-only you should get another
>> failure.
>
> Correct. dropbear doesn't allow login into accounts that have an empty
> password.
Is there any way in e.g. post-processing to set some passwd (maybe empty) for
root user to avoid such troubles? Anybody using it that way?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

thanks,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
