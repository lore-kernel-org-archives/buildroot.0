From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 11:08:17 -0700
Subject: [Buildroot] vsftpd
In-Reply-To: <20120315185208.0b235ace@skate>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6212F7.3060400@wut.de>
 <CALo-6+jD9RYLokKJGdOV1p1mk=ZFUd+uOY5qnCVuK3jTb9mSOQ@mail.gmail.com>
 <4F621A0E.6060405@wut.de>
 <CALo-6+i_VRjU89=VEWS8A_Bg49eCVwwVeTFsTBVfAMvgXHzhBg@mail.gmail.com>
 <20120315185208.0b235ace@skate>
Message-ID: <CALo-6+hYAASvCoAut2VmjROMa277j4ehWec8k4o=TeuRhm_Wdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

I will. Basically, I need to download the latest buildroot in a
seperate directory on my laptop, build the vsftp and other packages
and put a patch together. I need a bit of time, but will work on this
in the background to help move it forward.

Charles "Trying to get past noob for the day" Krinke

2012/3/15 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello Charles,
>
> Le Thu, 15 Mar 2012 10:04:45 -0700,
> Charles Krinke <charles.krinke@gmail.com> a ?crit :
>
>> Thank you kindly, Markus. I now have vsftpd accepting connections and
>> navigating directories on my MPC8321 target using buildroot. The key
>> was the config files that were missing. Once they had appropriate
>> entries as you described, everything works.
>>
>> A "ps" shows vsftpd. A "netstate" shows ftp as a consequence of the
>> "listen=YES" statement. The rest was user configuration as described.
>>
>> We can close this part of the thread and see if we can help Yegor with
>> his ARM compilation of vsftpd.
>
> Since you solved your problem, could you submit a patch to Buildroot so
> that the vsftpd package installs at least a basic and minimally working
> vsftpd.conf configuration file? It's better if such packages work
> outside of the box with a minimal configuration.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Charles Krinke
