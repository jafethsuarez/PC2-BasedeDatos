PGDMP  *    %                |           DraftKingsBD    16.2    16.2 +               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    DraftKingsBD    DATABASE     �   CREATE DATABASE "DraftKingsBD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "DraftKingsBD";
                postgres    false            �            1259    16560    player    TABLE     ~  CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(255),
    foot character varying(50),
    image text,
    position_mister_fantasy character varying(100),
    short_name_position character varying(50),
    group_position character varying(50),
    age integer,
    shirt_number integer,
    nationality character varying(100),
    team_id integer
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16559    player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.player_id_seq;
       public          postgres    false    222                       0    0    player_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;
          public          postgres    false    221            �            1259    16421    prediction_results    TABLE     �   CREATE TABLE public.prediction_results (
    id_result integer NOT NULL,
    player_id integer,
    old_score integer,
    predicted_score integer,
    old_price bigint,
    predicted_price bigint,
    prediction_date date
);
 &   DROP TABLE public.prediction_results;
       public         heap    postgres    false            �            1259    16420 )   resultados_predicciones_id_resultados_seq    SEQUENCE     �   CREATE SEQUENCE public.resultados_predicciones_id_resultados_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.resultados_predicciones_id_resultados_seq;
       public          postgres    false    216                       0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE OWNED BY     n   ALTER SEQUENCE public.resultados_predicciones_id_resultados_seq OWNED BY public.prediction_results.id_result;
          public          postgres    false    215            �            1259    16574 
   statistics    TABLE     ]  CREATE TABLE public.statistics (
    id integer NOT NULL,
    player_id integer,
    team_id integer,
    market_value_real numeric,
    market_value_mister_fantasy numeric,
    fluctuation_value numeric,
    average numeric,
    score_player numeric,
    points_antepenultimate_match integer,
    game_played integer,
    minutes_played integer,
    goals integer,
    assists integer,
    assists_without_goal integer,
    balls_into_area integer,
    clearances integer,
    dribbles integer,
    kicks_to_goal integer,
    recovered_balls integer,
    possession_loss integer,
    penaltis_failed integer,
    goals_against integer,
    red_cards integer,
    ball_stop integer,
    penalties_made integer,
    yellow_cards integer,
    second_yellow_card_match integer,
    penalties_caused integer,
    penalties_stopped integer,
    own_goals integer
);
    DROP TABLE public.statistics;
       public         heap    postgres    false            �            1259    16573    statistics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.statistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.statistics_id_seq;
       public          postgres    false    224                       0    0    statistics_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.statistics_id_seq OWNED BY public.statistics.id;
          public          postgres    false    223            �            1259    16553    team    TABLE     m   CREATE TABLE public.team (
    id integer NOT NULL,
    team_name character varying(255),
    season date
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    16552    team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.team_id_seq;
       public          postgres    false    220                       0    0    team_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;
          public          postgres    false    219            �            1259    16445    user    TABLE     �   CREATE TABLE public."user" (
    id_user integer NOT NULL,
    email character varying(255),
    password character varying(255),
    creation_date date
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16444    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    218                       0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public."user".id_user;
          public          postgres    false    217            g           2604    16563 	   player id    DEFAULT     f   ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);
 8   ALTER TABLE public.player ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            d           2604    16424    prediction_results id_result    DEFAULT     �   ALTER TABLE ONLY public.prediction_results ALTER COLUMN id_result SET DEFAULT nextval('public.resultados_predicciones_id_resultados_seq'::regclass);
 K   ALTER TABLE public.prediction_results ALTER COLUMN id_result DROP DEFAULT;
       public          postgres    false    215    216    216            h           2604    16577    statistics id    DEFAULT     n   ALTER TABLE ONLY public.statistics ALTER COLUMN id SET DEFAULT nextval('public.statistics_id_seq'::regclass);
 <   ALTER TABLE public.statistics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            f           2604    16556    team id    DEFAULT     b   ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);
 6   ALTER TABLE public.team ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            e           2604    16448    user id_user    DEFAULT     t   ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    218    217    218                      0    16560    player 
   TABLE DATA           �   COPY public.player (id, name, foot, image, position_mister_fantasy, short_name_position, group_position, age, shirt_number, nationality, team_id) FROM stdin;
    public          postgres    false    222   �5                 0    16421    prediction_results 
   TABLE DATA           �   COPY public.prediction_results (id_result, player_id, old_score, predicted_score, old_price, predicted_price, prediction_date) FROM stdin;
    public          postgres    false    216   %k                 0    16574 
   statistics 
   TABLE DATA           �  COPY public.statistics (id, player_id, team_id, market_value_real, market_value_mister_fantasy, fluctuation_value, average, score_player, points_antepenultimate_match, game_played, minutes_played, goals, assists, assists_without_goal, balls_into_area, clearances, dribbles, kicks_to_goal, recovered_balls, possession_loss, penaltis_failed, goals_against, red_cards, ball_stop, penalties_made, yellow_cards, second_yellow_card_match, penalties_caused, penalties_stopped, own_goals) FROM stdin;
    public          postgres    false    224   Bk                 0    16553    team 
   TABLE DATA           5   COPY public.team (id, team_name, season) FROM stdin;
    public          postgres    false    220   M�       
          0    16445    user 
   TABLE DATA           I   COPY public."user" (id_user, email, password, creation_date) FROM stdin;
    public          postgres    false    218   a�                  0    0    player_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.player_id_seq', 758, true);
          public          postgres    false    221                       0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.resultados_predicciones_id_resultados_seq', 1, false);
          public          postgres    false    215                       0    0    statistics_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.statistics_id_seq', 755, true);
          public          postgres    false    223                       0    0    team_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.team_id_seq', 147, true);
          public          postgres    false    219                        0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public          postgres    false    217            r           2606    16567    player player_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            postgres    false    222            j           2606    16426 /   prediction_results resultados_predicciones_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.prediction_results
    ADD CONSTRAINT resultados_predicciones_pkey PRIMARY KEY (id_result);
 Y   ALTER TABLE ONLY public.prediction_results DROP CONSTRAINT resultados_predicciones_pkey;
       public            postgres    false    216            t           2606    16581    statistics statistics_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.statistics
    ADD CONSTRAINT statistics_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.statistics DROP CONSTRAINT statistics_pkey;
       public            postgres    false    224            n           2606    16558    team team_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.team DROP CONSTRAINT team_pkey;
       public            postgres    false    220            p           2606    16593    team team_team_name_season_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_team_name_season_key UNIQUE (team_name, season);
 H   ALTER TABLE ONLY public.team DROP CONSTRAINT team_team_name_season_key;
       public            postgres    false    220    220            l           2606    16452    user usuario_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    218            u           2606    16568    player player_team_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id);
 D   ALTER TABLE ONLY public.player DROP CONSTRAINT player_team_id_fkey;
       public          postgres    false    220    222    4718            v           2606    16582 $   statistics statistics_player_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.statistics
    ADD CONSTRAINT statistics_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id);
 N   ALTER TABLE ONLY public.statistics DROP CONSTRAINT statistics_player_id_fkey;
       public          postgres    false    222    224    4722            w           2606    16587 "   statistics statistics_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.statistics
    ADD CONSTRAINT statistics_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id);
 L   ALTER TABLE ONLY public.statistics DROP CONSTRAINT statistics_team_id_fkey;
       public          postgres    false    4718    220    224                  x��}�rG���������f׮��=�FR��1�%P) ɪJ*5�7w9�^\�����ƏGP�@e�:b��c֭��p?�~��rq�����еw�f��uw�m�v���뛛������t˫gͳ��Y�m�e3|�yv�^^��E��/����Zw�e;�6˿He}�_K��������X�o9�Z�^~�j��]4��v�gZ���[�ɗ]3���������E�Xt���f9�����46H�N�c�ј�4�?�N����_6������)1���WW��N8�T�N%go���joV�������X:(���^H)��q��,��ЏY�E:���v���/�ZFX�܏�R(���7/���L����?��j&���h��f��k�ݼk�t���a�r�S_K��;"?����"g2̾Yn��t-Z�i��ó�6��������ř���I�&~14�n�5��g'��h����0��a�0*�0e(n&�ޕ(:��}���C���3�ŗ����rb�v��=%;�v���4_�w�gg�N���]U0^�q�!�QN�I���r4�%̾__����
������1C���pC'����v�����@�Z+p"�p�J>��:��#����f��دT���|�rU|+F*�����O���� go��P�e]��:��|bT�V��|
\mP�d��j�ޕ۫d�8����G���{y��}.����z���e+��Ȩ�M��.�bu00۳�īfU��S
�%�g{|7�����<_��Zv�1X�C�?"-�������<~�����kn�
n�m#���ѿd8��Iw����cx�����U�(�5�:zN��̵<��ԛ����ɋ�#}��� ���|,w5A(D���Ϳ��7��~~mWk:����x�s�j?��M��:A�4~]�|���`�=E1;v�ӗf�k.�Ec�(	,µW*N��x O�<;9m���#����P�V���(��@�}8̫��_	r���S�j��^|����9'������p+"�F�rJ)K�(6]�&��<Elu%����$`��\5�d��� ߶���/�<���4�=!JF'���u�Gĸ�?gmf*i�#����ߺ򷣬c���QB���a���ُ���%�q�����E�$�P�c���1�H�X}Թ���9 6��̻e7TH��zdl�j:Ǘ~v:�'��x�m��.�=o�y8'�>�-��q��J� ��B�����MG�p5Q;k����a*#�,r��g'ߵ����N�@���eJ���I��>���nC�d �����o/�|���h|.�|�xt=q���0�E��S�d1�=)���}$���M�R(�^����H�0�J��k
���o�^�Oo����e/0�b~�	���F��-LWY��8�,��n��F��	�q��l`U�*��:�Ǎ�m�zW�����$N������iA��$�]]5��aW���R��9�T{�*Й��ݳ�Wݪ��c�|�hcP�иLF����j��������Mq��Pb[�.�Qb�8��ٗ�t�(��fh���b���[��.�M܌��~x՚΢ �4�殯P���Z�$A���&�1!+�QD"�C���F��QBq&k�������M�K��r�w7�U[\r�����g���j�������ȫ_��ͪ��JT���{���p���"pw�����}Ѵ�b��&PC!/�Wx?#�z�~YU�{	���Ԟ���[lg�`;��NÅ>Ц��r�9?ZO�3;{>���t�f����G¾�|�6����36�_��/��2AL���\~'��E��	e�sk�K�S������e��e��.��4���t�s�G�����]/���m��R����y�C�Fq��mK�[�R �aCs6%���P �Y
��wPF����Η �N�g��B�(��%]�����&J������f������;���V����h�8YbBm�fyQn,��d*�Q����'�9���]��[�`�_��7�a4�n�m���6� )�w����d�[^��_���r��Ȏ� Ǉ�][ޱІ`���m�8�>z �㩘B%e׫��m�y%�.r��x&?Vހ�E��X���J�53�tZ��/����B�(�$��n��
Y�Rd�xL�ʨͨ������4�n��U9�$o'��dL0N�ö+F�$Z�~�?�;o��[�+tw��h��Ѧ�]Q�~�h.*|@�7��A�u��J��̞o�"�/��Ӽ��u#Aw�Ej���۩R�G%�u?lګm�n�3�[�űH9��ۺ����V�%�ܧhƻ�z\R�1���4�i��$N�y�P���`F���7�!�D.�T�>фo]TUu����ݵ�Ey��R�S���õ)rn�,�	�7V!���q�:�Ğ����?�Q��H�����������G�%d�o�j�8FT�OQ:�-bE�����Å����|�񽾣_ׯ+4�	Py�dl=QN�)�s�|���G��������q��)��� ���沝��Goq�)%���v�����¼��Mdnp>{m�	���7�N^��/C����`�p�^?nI>n�X�����%p?�Ͼ�϶*؏��saY�w�G�1���fo������g"�Q�k���Ӎk�,e�WEI�� y��6C��(
���AXe,'���{��;<p���?],�O�4�h�)+�6G#碿mW[ֱ�����D
�F�m��rɣ<I�բ�x��yΆ�]����ќ���܎흛0��ρ��5izeVk����90x���Mһʨp�t[÷����.��ϳ�*�wV{��S�tڢf��Xt3^�]���"A���@F���eLN#"_l���;�d�ʑW�Wk�SR���*�Π����Vt�[(�;N�AS�/ �_,�ռƼ=�-9O�0L5�5#2_Q�8�_��M_�L0�+n�e虹�M7�t$ǥ����]�`��k�\v$�A���ɾ�>3G�L�7v�,Pé��u�J��I�r=��hM�ͱ��W��+T�Q@w��C���TU@=Y�i����f6�2+!̨U��
GW�P���Q��7���nQZ�<]����!�����~���Y���C���KE/�H�� u�LFd$�|�,��g
�n۩[��
�B?��P5b���*���S$����\W �z��;E�Q#���`�`H��aM��2o�ey��Ѓ���)&�|~��L�E���mW��NY���|�y�i�Eֹ#�,��~ѕ7r	
�8����<&>�t��������7͒Pr9�HK�k1gŏ���BNZ�
�����Z(�s�F��h���)𽲲���!�����"�s�X�������eF��� >�h�	`y�v�ˠXm����@xF���3T(�!��
};G�)�a|�u�i��[���T��e��ȃ�͸��x�4��!N�gE�t]�*���[��~����>�� V^-0�wS		a2]$	�1����("m:�VH�ߑFAm[Pq���ޗ�S�n��{."\��u�4uj�M�F̃@�])(����fAZ�~j�բ}G��z��榜(�E"��~!ݡ|VIn!?0�L>_�6ur|�s�l�¸Q:;�q{�B������z������r��� �p�˸�0U��:�����	��I��x:֞��:�o88P��,��RS�栔炽�C��HרB���  ����v�m�Ų<�v�r2�.S��I�kv\M ���U �K�e���6��46Y�		b`�û��y9�x�0�f"�Q� �ٻM�Ύ�2�!h�t-��	OKA���?�U�/�����%�i��4y��=�����ϻ�6�ݎ�Mf�������ZocC�,�*�;A!R�7�xy��ݦ�0Y@�:��	x
���9D�&�ۉ�ӳ�Ӻ[��5��V����e�����.�m�%r��m��S���(#����PwA�6z�@�/��(�q�    G��%�guKM'���ͧ���Tc��^��������s��v�~c��!U�n�(��v<��g��|e7��;�u�,C���E�2V�>�i�$��C��W��)��<P&AZ?��ļ�$�@\Z�?Uc"�X���G�>�γS�!ˋ-��&��� *װA�+)l�CʑK>�a�,�uO���*t_��фm�F+31\�Q�ޣ�R0�2���,�+ϡDß�[�,�…xt��x:�p�r��F]����s�����\�;ԡ�k�Ej�^�O���a$�.���
�Q$ς��Rt�$��=�!�v<a���E��W(�����R�?Fɚ�*Qd+�+5ï��x�M�d�!�2���d���� 2	�,�
s^k�f47��f<������N(� "�nn��B�Ġж������> ��,	02i�m�ۦ<'2�FfvyC櫎���y���s���8�o(j'̘�>�%�g�F�&R`�@a�R��P*2U�`��ن�����MsV�bk.�%c]_.Fb��G�.~�d0�`A�1<��y��mS!��$:+o��?|7��2^���m�۔7h������d�c�T�'Y\$����D��v5�R��)���["A3{X�|=|e�������
}^����]��AK\�JNw��k�.%�e�ԋBxiU�Y�f�8��f��5�Qȷq�U����Q�[�HJ�s��/�����>ܫ�x=�΄��X��ޒb*هv]cD_!�y����	��b��J�ϘJvyݕ�ƥT�q�:?~b\��/ ,��t�)}�7��=a^D$c�T�{�IiK7��IË�8��ۮ�L��>M�{흓SzCl8�����'.�R��]y"��J#(L�[@6w��@��w�������ȕ��>���c1֑h ��}6�k���{5��9.E�k8,C�� �Fe�; -��(��"sn@W���Nd^g '��^vM�n���:�uD9��A�W`4c��概d�!�%Um��Dn�6=� m��A7rW����%0�X+-��Vw�S,��In߂P���m�CQ�+L���� ���Ϡ!VATǊ`�n
Q�����A%�듶�|��5&��sЖ9��lL�pY�߸DF����,�{�����߯�Q�LGn�wM1TOy���W�� �|�=_�m�~����l	F�D�}��tl�ZP&G�i�\�
��A�������̴��d�G�m���c�Q�T�
�3�I�)��fY�I��Z<x�N��7�i9�4<��|К|���:�5׽��A�C��Uass!�����:�T�E}9_%S��,��6�q�,>�Օ���Ⱥ  �q�����-�ۆ�����e~ay"{�c�����A���Q���1@KH.���12�Y)}�G��ѫ9o~��-�-��Q#$��q��~>-�!�@�����˶X��r������GGf��˅ʍ�B�7ww���,����eA5�"�j"���( Y��o����d�m����Χ��/�X�����2����B�G�|�8d��{���[vͪ��x�u��8nT���A��×�Y�0�֚�t��,!HS�p��d
T@�6I9P��[y��{�D,ɿ9�������3�me֣q�]s�Ua%�������X���f+B�J�MR��fh*HkzVz��5��c�;�4��/;&���+�<�?9-�u�X�O�J���tw[D�B�i�.��*kY'�H��3H̪M$|1�Y���
FSZ� �k����6�`���6�f���M��)ĥ���B���[�YAc�&�H&�@A��9��!����<��ZT��g�C`O�";BeʙԒ�Ԩ�E13�?��2�4�W�G��L9���Y,�r�t�t���Q#i��/�7l��{!�z]���\��Jf�
��Kd�4�ng�qzk��HIe��.�~�<����:A�n;.赛�O���̅<Jw �iA����V��֡�m��!P*{�3���"y�w�5��m�4N�?a�ݎN¢�/7��5�H�+��+&�RGd`p(��>w��rSa,�z+v�H��c��X`-i%��fY���ј��z�b�C��=R�Q<�H���r!����a\���'2��d�r�Y���E�"7>�����iW?S��p1�Us��(�:�-�����4�UY�Q����M3�@��	���-{=��義@�d+�mu1�i�Ȝ����B�x^>�e��,���p�a��ΚUt!A̞�����0@�E!�j%�����*j�zv/��X2�*	&S�L�~Ds|�,������]OYQ���6�G�#I�%/G����v42���Հ!��(���!&J[G�ey(��.��<��'�������	)%�7��¬���r����;E��*X����k��}�t�E?�׋����l�}ޱ��N��!λ
����#���Qq�|���# |_C�i��֚bxT:x��+>�8L���T�ٖ�c���w�y#�8D�tV�Ȃ �Y<}��-p�G�{w��? �¾-���9+V�(z�t ���]昀B`T��h+��'�f]d�H푱� /�~3����۪`Ի�ssW�@�����:�L�Ô�� .��w��j�5J��hpƑ�j��خE<��jѮ�r�4�:m�8�1�h����8�>�n˓Sa�<�B,�:wJ��ݢݞ�ow<���䰏m���'�'c�˗<\���V�͗�<X�x�}^)�Ŕ'��>o;D���|�P<*���`��X��q��G����_Qn�K>���)��)v��>��(�%1����$�{��lw�~@�F�ej��e]+������w�`�УC��*7KJ�HWёR��~Sq5�@�\��;�t�<�<A���`.��Y#
��D�d���bj+X�N��*��t��OӖG��HGqxC/Yq�UK*� ��j��Q)<�%��4�~}��������)�R�(T�P�l�FS¦�\��/�HI����ˋf���#�@[3aJk@��Np3\ax�YU(����q7"!��:�Af��&��"@U9�S�/��{s���J��^�a���-���@�i�ҡ���q�̷���������)t���f����s���-�z��&LyF"p!,dKY������N�n�U����=�݉��w����LK'*�)�	�$X���	y���l��ٻnq[��Q�`=z���LH�Ĝ̆�S�ڮ+�N�G�E*ѝ˟p����_�+��HAg�O�GF<�}�����%�V�6�1�u>
���'����\(E��؋v��W��M�������LDǑ�?u��
�:u��@����(a��G9��j���\�`K;aV[tf��\I�:{�Ѕ�k�J�Z��V�i����~�L�� �U��|�
ڧܨ�y3e�A�p�b�k*��6�vQ��B6����A�uj-8�M�:[�҄���P�W�G&c/x��4�,��N��V2X��V���f$�|,y6�~�j�T	<F8^�}n;��*)��Hp�q��lULƲ���+y��`P����Jt͚
��Wb(�Ϣ�"���7��_#3!���q��k5$���Idw8��a*L"�&:1m.�
�\�}�Ae��|=eMys{Q.vj�A���S��5�5j.���/�V��?����k��v=�៚���5��
Sb
V���C��|�zb�e���:{�V����U������P�<.��}Z:zq�\W�B�����VX�~�F�-�<�v$�N�.Dϋ�4=������6��(P�5k�֑���>Z��X�	���f1��7�g�����s�Y�;h��Y�]{;�1d�Ƣ�{6�;�cB�ܑ�O��E�x�6��)�
V�RjRIq�(�ʫ�#ɨ���Er�F���A�H�f��`5�Mz�=kX�����M5EL��I�����
����R<�&'�,w/���rj�|�l�y�J�'W���yı��c�@���/�����G�TG8'p>E�p��6���]����N��@���S�����    � ��rqR͊}L(�j��nG>�oML&s�-+hL��4-(�>n3*���Yޞ~�^4�nWFϸKQ�X����a�f�
o��Z�T�p&i��� �ܑ[p���u���@o���3K��S?��O�����V�\G��P����TK�&����N�7�r�&�?�;c)��������2�&��M��ȇ�t���ÅD����&6f|[�Z�@�1��{>�dP���B��[���>�����g(���Q�����#`��aٗwk����\�1F[�s�L�	�(����)'P[)yC9�~&������8�R�{�daB��Ӈ:�D۟�%���cS�TDY��-���h��l�b���E��1c�V�~��Ǝ�d!��|&0_�4Ã�ʎŢ�;ʰ]J�r��PѬP��l�,�#���M_?���^^�7}qy�9��El~}Ľy����8�Ҋ�r�{���҃6ʙ����y_��:��'m����1".���Z>N��AZ~��`r��Ք��`k�cƍ����I��rٹ�z�j{����8Q���~��;ӈ�{��������X!�|�ь0%[�9�e��&�ɛ�E[��甀J��^A$�h
�&y9����m��@Z�������d����Uz̞{Y��ЁA�G�a��#ah��L+Ȫ�NE�@(]*2��k�t����$�QIg��ʉ�`����( ��Y{�kF�r�Z2`��PV��n�c�@~/���W�߱���O{ȅ�J�c���<8�L,���!S�K)����)Џ>����������jL�9-���S��<�u���,��
�	�X¸�O�N�c�a��K`v����IP5�����>�N�x~���}�{~�CyF��`dJʏ��*2��=bm-��O�b�8Z;�#8r?�IZ!��y��ƨ�VvL:91%g�a8�����ҹ��#+�HX�Ť?>$�c�\�\}w�5$���0GA����hL�53z(�%$)��\N�G��1���
���n��p���h�_*l�%{5�%Sً7�
듛P"Z�0`�^575�� ��2eQN��%�)FD��}ٵ��/.��C�\���%���o�����d.�U?�~�
���N�x��g��X��)���-�F �z���`ݱ`�d'U�������es̗݊��.����K����c)�����lQ�O+Y�(ZX��Yݕ[��!��.��jg&J��rޟ\��W5V*�X�!�F�����mrD��[.����3���hG�b�S�!��Fa�5�!�f�Ǆ��䑮�hS#xyij�_�k�s�8�
1����,q�(�0!}�Uݬ����.Bƻ�T!�1�ᩝ���#K�a���7���B'�K��9%V�N=�,�ri}X�O�.����%rꢣ�h((�^o�75����Nw]M�JQzfG����^�NX�����k�	L���[*	�	���4Q�A���)�s+'�_�/��Fm�b��+U�K���JƑ�*̊k����+���+�P�4)Lq�dN��WLz-�]����!�S-�ч�b&+T&8��V�0�t��C�ãT6o�W�̶z���*lj�6�]<����33:����y�� �C��B𕢠�?_u�w���_t�u��~����0'X�Ըx�h2e<���y49A��,�͗
@��#i�tF�l~!i���]��u�<�y̢���QHᦆW%����:	+�w�<��虽�6e����o=x
f�1��Q�}Óp��2Ld���+X�w����p{��g�P��)o��� ;�+^~�9�j7��Z���c�ă�j0(�2*g]��24��`�3�	7���}����R�<G?�<��ir"z���x-�t�P?�zA@�8�&�F���'��;i�
��b���l�X�z��@װ�/�p,���*B��Hj%X����i���(ۍZ��-��Q�t��>�-�'aP�M�wݲ��%�f*�Rc��~�t������|.�5�l*�'��}R�3����~���5}�}�(��kW��(��󦆣?>g�*����1�{9 mg��lQ��iW�mW��k������M���%O��->�Ñ�d�J���U���]d����/UىFlJ��f��]����,9,��ͤ�:l����@a�Ā�}��_=�4�G���Qާ�"�@�"�q�t��+|@�f֗�rv!�k�s�ɶ���H�=������Ɩ��8n�I"����@�����qެ�_�A�߉ �_[11U8Z@�v�n+�o�V*m;V��V�|8��ְ`���M9�2[�������ӥ�/�LRFm*8dew҄��C�0�
�Qiq�~��̢�.3����>b����V4� ����4�?���:��$)�f5���(��$�v���?���<m��oY9���X^6�&`¢��ɯ�6�z��T	5�J�3ҫ�z�s<%�tsW�{g����_���|�Ta+g��+��*Vc�y��0�aNѱ��M\w�k�hyT���9Ô�7��u{Y�D���c�%!�&dxT�!�ey��=�G�D?-,��?��D�eޮ* ���%7��J��^`2�f��Y�O5�U^1s`;��d.D'��>^�T�^ߴ�j@E���0D�'H�YI�0�e��9�fh�\I��VRf�Jz���f���oƞ�tg�����C�K�}i3I�5�%�������t/�N�����6��@f�Z�+�Fu6�ݯ哗����BP"_��zC����<S�y_��m�-]`))m�D�"���ۼA6�$�u5���T>7Q؉uw�� yp̕ge�Ew1Ԡ)YX����q�3�\��V/|���4���XC!F�G��R���1�� �Yj�&I�P�t��{`����H�:���
鄦�a�.%���(�,�/ÃrL�Yl����1�Юj��zǋ�r��'�ӑt�.@�z�+,���={se�&��|}�a���P{�;D��K7frC����y�<�6k/o:��˺��R��tz���%o-�V����0U����j�"=̘֒� 6�sݮ�J>��'����;W]��Aa#nK�!��EC�;�������n�*{@%��Eg���WW�3��"�b������.@���k�*Ƅ��A�'��#i�1i{ff��cR@,ەu�Dn
��%N�߶]�I�8AV��7���E�|y�h��u
�eU(T&A#8�\�̈́�H~���\���;PXy��J���L��0�Ά�}��Q沼��k�+%#o<��WǦ����3NDJ6�5H��+�M}hC�"�q��!� a��_4j��;%�� �Q��)6'�Q�,u�BF
������K�1u+{�
12+��)� yٗkƂ�Y¶���^��r�X����¾ ���R��|��	��-E�`�5��r�n�@A�	Ȩ�Ķ�A|$ք�����0�a��v��
�O� ��i�"zS�WLv!�1r��.�X����I�xJ\8�Li�$�)�4#p�h�H�N�Mp�n����'�Q����Yv�*�Fm0�G;�B�6Ů�����u���ݩ+F���Թ+$Ϝ�λ��@���C(���#k�cn�Qo�+M�t�ByGd�Q&O��oaӑK������ZJ�Vp<L���D%��|`�\�k��F*�B\�E���	w��D�/���G�>H/���X?�+=�E�G�����=��Fx���QRk��j���Yu	7�ͣ��D�r%��!8+��ZMr�}b��V�:I+�Z	�P\NJң��<���$�����7�F�e}/�W[A`�A�h?�4�f���2�!x���fqY�EHGɰX� �G���dkI'Q�7�Ǯ��9�P��a�"��q�XL�|Z�t�\\�3E5X\� ��"�0�bt��o�Ŷ'M_2�y�1�/�?�˭�Y��$���.ʏ���MʃO1�lF��$I��.����7��g��	1��{�e�,D�w���v�*����4hY�-��"/��<�����i�-�S��PZ��5JG�.��ً� Y  ���\l*�ik��	��?~J���f�PR`�����X,���I�ܷ��'�E{�b�0қ�EW^.�8,�J"*㹛|oB�XHaGnk��vU���n��a89�Z>(,���:��tW�r�B�F$-:�mz,��$�r|-E�w����rSe"S	i��-��	B	Ɖ���R8N�H��j]!҇�Ҧ�u�z}0���㗔�o���� ��]��rbXb4�����/nk��(�k��D��2T{8��SV�%�V_�wMy����P$4z*1L"Q����fh�Lg���l���sD����I�5S�Q�p�b�����z��P�P\��X��&����zh�D���5�޷��jQ���`-+�O�G���1��O>�ݖ3��57�u5L�5Ť��\���b������/�r����������,&i.�K�U�s�gT%(���b�N*���U8���,i�E�)�;�}�8=�w�����S>���I�jb�=�T�O��d�>�vzf
s�p���9X����F���iѬ��f}S�5�^�?��3��;�F�̂�ŻO��,�%�})�\>��	�A�'`/��}y2o'���O�9Ja[W������f<�'����l=5}�5��7�˽��"x�Y��Jq�����M;����iI}�FC�H�B�f ���3��֠�'O�B3����[Ѓ�*\Hke=ab��&��,p��<���G�k���.�B�h)	T���i�Ш@_l�n�Q��%1���f��k>V��'ق`��EN9�$)b>��9���
�Y���%&��P���P�)~�>�3�:K�c�W�*�Z�+YW�(#ǻ`G�|�7��;0bW5J"��-(����K��BVc���c�t>������?�8���7r:�,X�M�bQc���z��!���O&'��0���e����Gٿ��)�!#��`��\���tϴve�~4���@�^?9a�ӱ�������G+��_�qB,��Lpɛm�|ΐp�\��D�`rJ�d�D��o��k(\"�#es�4��"�kx�����W�W���h(�WG:�N���~��_��� d�.�]��T�mHnQ��7��C����ئ	,�U�u<=�|���A���;Y��}~�C{�zt����jY���f����+RI'A6�� ����@9�Pb1w6�C^�r���0ڬ��Q"��Y��>;I��y��Y�����0���BN0�|R��W��ւ&�����S_ad�������l<�;�\�gr��n�y��a\ �L*�W����U��W��<MyK�l�bڗ��.�#�R$�>t7}�rDĶ�|zQ��H�}�7D��?�}��W��e��            x������ � �            x��}Y�\�����\J�}3���?���$p�a;�W7um9�D� zl���'�����'���{R=�7���<1�'?�~���D�W{�~�M+Oxb��+�'���֟ԙTT���Bߓ��W%����	��N���	�>a<�>37�7����A��ț~L�)��k<�?������c2S/X?���MXwv�QiO���̢'�o3�V*�^�I��D��#2m�}TK������'R��kJ}����{U���"��G��+Q���R�f�Ēԋ�{�/��S��u:`�*i�#��f��Nv݉hW�b�d���O>�љ�`��%??�p]�K���+{�}�鷧�H�q)��	.�g@�p�-VZ�%�w�,%/�w�=#��e�OGp	RC\ ă�;M:}Z�bS�5n��FQ�Ăc���l�$����[�a�+jl��M����N�MD�=�?�A�AL���d'2�XIUGx1���Ñ��2X �ĕ"���OÇ�<L˝%�����C8z��y �����bCl��˪I�Fr�O�ۗ�62/$U�ˀ�f{�̧����������&K�o����aɛ!33��9_a�F|�E|+o�e-��p����Y?+��'I�o�0ƛ�HU��^[��Og>Bd%~3k�p׺Y�#M�4�k�����A�%=w&͆�x�����VЭ�O��Ӑ7�a����x���=5�@��ZW�����Nu��A�����2�
[A��,Ҥ�c:�'�ms
J�YY�#�_jq�}V�~c8��)Ba�%��G�9��L�	�7^ϦeڔI�7K�3ږ��6+���;l�4<q��m3�V�c�OF���F��
�{����'�>ᨲw�5���S��D�Gc_#��s��؃��7q$��i�1��˯�ű]�Y�/�s� �`K���GҬ���7ibl��e<�qQN�O0᢫��f�
_b=Z�ƻ�Q��֕��H8��OfԸQ��>�?���5�O�]� �{��uk��	msO�Q�^����&QV����4X�t!ܒ�s���^O,A�V�>�P���h;��p�жX�k�.�*&��1������ИV�p��gSO�=����&��:�Q��uJ��X&�#��X?gX��R��>$/-��rkR$�
�6 \~�7m.f6��䐽����fC�o���q�NC�<Y�W2Q-m:�P�a���p<׳�$ ���t����+'5V5A�n9,D�LQ���G�,98���A�f�Q&�
�)}*#[��%���K�����2��H���T�I$*@�x��)�m���_�8����I��l�Z�^O�m���x���a��Ma�q>M"�[��d�Z��|D��^8B���Ǆ���͑�5>ɁK�3K'm"ӟ�C��2F���hue�V���ܗ���پr�üN�h��1ywI������w�\|����D��7lcoA!x��$�[c��,36�>bT^4v ��:��eZ+n�N\ɑ�3�C<�pİ�?愶��#{���sz'݌�i>y��6DE�O���1s����XX�oۙU����R�\7�[�<��r��$6�����bN��_x��v�8GC墚99,�a����%�Gr�+�	y��3�r�����7b�,����I��M6Aw�2��l��o_�$�dr�%q3N�d�> �q�6f^
\��j�.�%�L�lOz�lPM2���b7� L�)yu�͕"�U���ZX��Y�Mjz�$Aҳa3ȧa-w�p#p��5�A=!�����r�!O{N6��vb6��uu���E��Y ���:�tV�t���J�~�����W�r��;���T�;�����B�ol��~�k���B�E���Ͳ~^,^�+��!m��<q#'���㴔�P�tU�"�Jd��<;��N����e�#8��ť�X��'&X�m�C��n����7J��;��%��Z$�}p���HX
��������u�'��$�%�&�α7��)bI�R�9Ks��L2X�����i�?����xy�fHg�엯��C�k��FS�A8)��-�"f�l�Xn�fbH."�����Ff,�-�G�J��8����P>BR.R#8����(gY�ا�A:S��	1#��U���:�
�7'*�Jdn�~��:m9wghC�KJX�����\D�޶i�騏P'���V!Ǘ��j�;Ɉm��J�V�32���IH�:��5f�c9l|��l�Kxl�L� �'�D�X� cU94Iygݝsc?�Z���C��%�I���C�uW��v��K,�8�x�Kz�#�Pmk�
�2��X�Fߚ�x;H���U�q��(
�����-���r۞d����2�V�;�fo)�$��cK��f�Or���zyycm��`;�=����ljzU�J.�͙r����P��bfqF�%�"���=f8EB�DT#�]���ah�t�V�8��0�1K33�]�,��X�����XT�ܪI/�|�|0i13<kE�j�LO��+O:����i��+��:�?�>m쮠J�!M�Y}4;g>�3���|������H�0?R�&ݬN7�� �q�K��C;%.#��I�j;���	7[�՝��1&��!}Ҭ�����L�$��"�����"��F�L�O�F�MVń�-N�u��U\�����)K�X0IU�-��O�ζa%ۑ��[��w���6�D��Y��w\V��7�I#��|���)�֑��)��!,�Q8сr�	4m��J�ͮ:��W���%V�٠����x齂��B�E:��Ɣ&��^$�ɫ���-c4^��5�"�`��1�Q�#s�.��8?�v�X��
/m`��o6vE�<�.���IB�,�2%�R��%�G�d�)"�32�M��15��i1�����ܲ[v�N���Ei�ȁ.Q��&�i[� n�V\4?z�vW]����.��vRJv�Z-��Ɉ7.�bO�gpZ?�K�Hpi��#�5gVG'U� �([$Ne)�Y�2a�9h�U	���Bc�l�w���ff���Q��KG�4����R�%��w  ��WPq�*ڃ O
�+�:�BC�ާ��V�
Bb������#ȑIYG�!�p��3;9,����ջ [2B'�l_:Q`E��<�S2˖pzXV\�Y&��J_nk&��ώ�Fh'G`�l�P�m_��(�:�yn	��|�u����m�SR�ʙ� �B��f+�� ��8���Ӫ�xdc�]�p���"�Xm�~P0���!NՅ8�f]��\�"C2��h[q%n��{��2a���W~��o�X:]��M�svM�
�T�I� ��*���6e�x�gC����f�B>��ڭ��hǐ�=�638�ѓ7���hj>����@@�a���rA?;||�[�̓H�Q�z��{�KQ*6�f�'��x���5�Ɗ�Ca�C{��c̏��X�I�+�R$p�)93Z�m�bS�F>�y׉l,��°h��lc���ꑶ�(w@�X\�֑�����W�����řGQ��8�躴`FVO:ă]�6$��Lm�����֛��?n&�E�o:�a�GD�v�M��.�`	�
x��N�ː����v���:(��
�h�	x'�Mw���ͼ��~�[��
d�����,1l�$`ȳ\�c���KT3VY����;1"ng�F�'��n �-�n��uAӹ8� ��w�D��H��'u�%�&J��^�'̤���Y+n6�������<+�J�XQ{|v�h L�[/������8�Xx�.2͂.]ڑ@u��f1��"��p@x%������zҤ|��ژfɭ+i1V"���Mժ���xڤ�a\�x�ֹq��UJ��pþ-���G��!�˭�2"���h�ʝ�7�;hm:�9�ܵ��'�Ƌ�nI�s�Ȇz� �zY�F� �x��9S��E���	����uV�.�i��颦-Yx/똘�Y�gڐ�1�>7�"��~|[�!A��(׎�ҷ[S��P6�hm
�t]6iC���!���v:mf����#YN�)aI&�R�����F	��Q����"�hQU3xa����3� sV�A�c8�Lq��pf<7C�	��V���%�@�ڲ�    ���6����a�A;\~ܟ������h�V�'���J�|���Y6��n@G]>x���@�j���YY�ݵo�Zx��w��"E-0����<%�s��fi�	��t�l���� ����A�NFlD��FL�հ��N�t$0\h����{W�K�$>ZT9��x��y����Q�qR������d$�1;iN&��\R�,)m�r/e��1٭^�����b��
�I'M"zejt�8��"�M8M᠐͆`�ti��ג��9���7ǎ�a��h�+}q�cP�kEJ�Xh����|B�,!.�m3	ȅmi�@�o
�-"��̊ҚL$�>tEc�9J�R�P�Gĕ�O2?A��h�`	�~�s�#6�d�A"�]��u[1uY;O�A/��K��(��i{��D`\�ܵ^���Bԇ䥋6ެ�|�~��&Ĩ,N��Wel�R�U*��.yя����w�P.��Ly�)�x��V�<��q�bU��]��$��a��V.�Z��$�8,}UC�-�;\Q�5��_|>*�Bq8Z�<~5cɬz��]Gi"�K\A�4#���16�n/ʉ���8і���2_��I��QN��pln�B���V�T�`��C.�F��tŮ��/�����HR��Tb�.�a9c��J�ڇkM�9�Z5���ϓ�d��Jݦ"ײ�b2S�ިbOX�j��eҾ�*1��l�߸Ͱ~^�}�.�K`&���;��Ԝw�f�؊r8�1q��`��T��C�3��T%�S�
S��8�̇դ�W�J{���f��4\����<?��I���,oY��4��ĻDG�rf\Wb$unu�Nz{�Z�橉%{�ñYC�6$���{�#Β��8�>��fkHl6��?�H(���D-��Q�l=1��&n�����䔽O��Z�8ڈ�;<�bs��<��=�D�j�������]i�Qc�aZ���\p�r�svQ�Rc�o�D0�{m
Y�i=��Ee�r���g���i݁E�3��E0�XT�bپ�g�
���Ἣ��m�b�s#�B�Vj^����DE�&���J�<�s��1� IwU�����.�!���e�Dy�W�� �x�V%�A1>L�
{~}�n�5h7{w����[@� h��:nTn�( �z�,.�,�mV���W q�%��2�_q�����YF����(���y��K	l(��}��{�)j��4�%7�j�>gp<�GΣ���!څkaQ@)�2yZ���r	iC�DI�m�8���p0�T��r+՜]��ǑV�	�+��c�#S�3��S�V��^�w�I����ä��}zB:!L�L��Ԙq�S|_-r�@��RZ�ǌ��;8Q�Z����n���չ�bA$��C�z>�D��E�)�#�HJT��<���5ЪH���ŀ58ɻ6��ɂ9㝍��Q�m�7 �[Vy%��+X��[2	�@b��8��0.��Pϊ+7�(��.q�I��:�4�=Zx�"��y�U����"�5WpI���aakr�����,A.���Z�T4N�g�:,�bk� ҹ�A�p��T`Ai6�ĥ���6xv>���Pәm;ʆ�i���F<����dv��&�3~վ����"��e�)�<�a!םz_���h�f�����P�m8Pzg A:�P��x��.싕��M�"m��-�iex5[�<V7JEmF��vgא�:.��\�f1����-a�v�>�i4�t���t�����X&�o#F�D=�&E���`3�q1��P�-��;T�I�D�o%_�\q�mp����z=B
q�{8	�[��z��n[ lCXn4Eɬ6nDc�$�� z���]������tJJ,u����)"�G·�\��.�[%$Jaw5=wڑ�H.�h[@Dw8Д��U8� �v-�kӷ�� w;@�#N��32�ʛ�p��7"���Wd�웵D���B���.R9�h��026�#�,��tl��7��!��8J��47���8Q����m]�h��S�?ڪdh9ːd!:�a��ٚ��SO�?\TP\ߒ8's���_�'�֓&m��|b��\E��z~+o�/�����-2�i�t)kj#J*��g����B9)/[|h�����n
�y%9��@i�+_�ъDP;4ù5��~3�����Gf�$��5R��;�G���!��I2��~+E�����1v�-��4�8�n��n�i\��˾t;�97�_$ʬ�h'�2r���	��2��=s��5��u&bAqci��:�B̟��b[ʢ�����UwQ:����Y�n�ށ��5�b�P���싁��Crr3E$�܃4��H���UnC�]$}�lgϖ���B�х	�]��H!a��v�I �AL�Xk+'�}hG�)��t�l�ڿ��9Dɲ�O� F�k�����R����9@R�,χ&6����q���ie%��*�5���^���0Q�]���<5�ܒ�OaUF�Æ�� ��J7�1�|뜥��%�����)��N&ƌ=��-I)%����G�)��H�)=E�bY��� J��axۛx�a�J,��݅4Q�NswD�f�O��f�	5��
�0�LI���)��ă\��2�
�
���k;��@��az}i!`�5���~��0o��Nv$���
��[��y��_�\��C���dfB�R�	.�����*���*���3c�UW-^�``B���6<i�b6��M
��(�&v��R�+j�p�F�v1<���t�H>%����^3}�`WΚ�����3.d'N|Aޭ�T.ڛ�����6}*
a���I�Z0�nr޳���q|3��0�*Q�Q�Ś�"�Q���	+~�d��*T�GGG5A��4*����,�N�P��D�V�42�QF��.{��NE�m]o�r�"�~<|7�I��k֚EXrF�[�S��*F9,@��L�񠕘�I��V0a+Vaj�#������`�$'�����<�� ��&Ϥ]���p^��OyC-pW�OR�U�WP�E�08�ޞW��,��Z��bJ_��S�b�)"˩h�O�C��� �T-�M`A�+��<��"ã]��;��CM���Ff��u���
*1�b�"q��ܘɲ{���-�l	��$c��Wd�L�<�3�\&.��G���*q���Fcפ_�e���%L�r��x���U�3�hx/�PS��0㥸x�G'� �v�G�p`�5�����XDmEV�#�;��ʗ�6__3`b)��JX�F\���B��s;�w��GO�T���{��ΝSm��o���r8�P�����rڔk[W�4�!��jI�D�溂'˕Qi�����Փ�B܀?����ݳJ'd+�9aE�B�L2$�?�a21�e�3�FE��$zȮ������E:2iܕt���	#����g)qZ���X2��p
����58)<�V�mfɌ$�E��ƣ��U@��XAaO�y�Ua�J����E�	б�5�j�=�Dؗ;6�}��֚8�����_��8P�lɲy�$�{e1d֫�����o�I�N�]L(z��'192*�/TE��GJ`��1���:�,�<��{���0���>s��/�ZyL-�H���4>�������|��ce���J�zrR�>	�k͍n+��re�²�k���;.TљwU�ѭo�
�逽d� ns�]�f���glm�j�"�Q_^0I1a|��{J�c��_��ˊ�����@��H��rD �ɿ�����N�G�t����ܐO��'u90�V��y��Y���i�r�b��2�3xQc1���/ۤ�X�,Sz�%�
��:�n�Xq��������uI0 XP�C���
S�����
?����IT�v 3_�_��d|51� ^k�{�G˺^��k��:R��m���O�Ee�Cp���=j[�͢y�+p
ۯ�?"�7w{���_�".~�&@7S�W�L�
���̸�jh�,7/��Ks��uT[xt��3��wN2��,���z���$���J'P��	��2[����qZ�q8W�)��G�5�2M�f1���$J�[H7�9�<��O��:AF]z �  *�ym�R͐������H�Fq���U �u�g?���]��[�`��Q�׾е�}$����l��� 6^��ZO�=�}�*�&Ѷks�k���C.��O�E�?��fG�Z�z#~��_��S�a�+o�kfE@|�*�'�W��j4��uqK��S$niR?H�4��t?���W��La�u	x�I�u�����no� ��Nmq��4R�zI1�NR��EJ�:�T{������xP��H%[�&�Z�稜�_4��a���������~�Վ������:�#W�5�]5�z�/��pc����5�o�k�2Ob�"�$�v��L�v>�co`&�VƠ�d偞8�f���&���KV��|��mqх�g�D}/�,��X�@y�N�/5p�"�׉���Z�ܡ0b��ߴ��9�%��8e�͹`�] ��Ž����|G�t��ݶ�������Dc���UyVV�����7N/�M��:�R�]	cKY��ʹX(��wӇ��x���S��C;��m������p�%�.�o���M�4�4%�B8�zQ/�^�a!i�Fr湌�8qF��Fx �[ի�am�~�W�g���hmw�_���Wa 횮_���n�I�m�0Eٙ_E��4��� �R�zL3���Z��@���"�l������ւ$��Q���5�^��e$3�J�F���i�~��n'n빱���-N�+�D����U�V�x�T�X馪�u
�ֈ����'v#�~M�f�c=�-~��Cq��J3T�BD�}���#��_�tVF�:��öE6��D���Ѿ�������>�&� }�f�Xw��Z}�`Ö����V1�HU���ZJ��0Q$�󴺛����`��<����`��QI9�.Wo%�)@'��t8П���1�':0Ż^��o��U�m���U�'ƒ��4y#I����3)��H�]�V�/7��\��<�pԵ�p���cٕf/͸�b.D���<$���/C����\Յ�4ǻN�K]�m������B�~0y�k�_Hb���wh�_|�Km�J��U .t�4]R%��O���|�W��F��P$l�E�����x5�RY5���`�-�I@�nĬ=���=_Z�_��ۭX�E�M6�۶\���h��<�i�M�G��WO��mX�t{e������+c��Z�Ǽ)��˕�*񤄭J�`�P��R��J���>�9?"�n��i\��9G�q��i�I&�T@~D��t/����kf���u(����"VKy��)�M����{�>Y��>�+\�5�m�Ϸ烱��i�{���� ��ջ�ꞟ6V�L��쁚驹�{o���{�M�g�c�[%�����a�ߛ�G�諽
���z7מPu���������J��3BnB�c�Pk?r�y����*�KT�-7i�E���<�~y�<	/Unl��x])w��e����O�M5z�'e�N��*�S��hM�W��<����X)͸)��YJ�,���K`B;h�M�OJ��z�.��� x�*��� *���&`�w˦e�!��{	�t��������rJ.g�����\yN���K��^�K�tM�T�o�M�CZ���h�����H���Jq��S*:pW4�C�g����
����#�y?ů˷���I���,�c���v'�ڢ$g�������z+>�3d�J:c{o�0TM���f�z+n���O��`�q�o||�2K�4��4(�	�H4�@^��´ �ic��Em����C?�Ò�0F�3��FoFIg��� a��a�WZ�~��f�?��O�[L+b89���j�4�yOU(
��rXh�.�~�#�A0ώ}�ō;��P�:�#i���ⱐ����<?<>�,#��^(*��S쭄�rh�Y N,���1�I���af�����S��)�p��}�2��glǿW#��oӜ��ąO�Lߗ��k2�G�b=*Fй�.v�c�Y%<H_Y{��G���ew]a�F�Κ��t��9uC�������O$ 2�k��ҿ�&旺�x����mٗ u���:�����q���[&(�,��u-Y�^�F�k�!uWdX��vˀT����N¢��	��M?��5��H5L�����Y���1��ܵW����(����+y����O�X�۲��d=���0E;3Э�ԩ�r�C�.�"�؃�9c`}�ޭ�k����W���/}j_k`7-|��li�Tҹ,(�~�ݛ��ԥ��N��R����t�h�su�������q|O-������;�(x����-�M7����I �1��_nܨ�?Ӥ�w X��E7�nw&�0ّb����[��v���Gs�o��E~�Pl��)��v.#�2�ت"*�S��)f�[����s0�:N��qQ�\�)�L���uo��H�:}�?�]�`!�ݽq�r��a;�~9м��D�n��˟���yu&�qt|;4���|¥J͒&U^�܄i�0�d~�؆%n�Cך������t/�l���G��eV�tx
����d|�I�$QOZ�s>V��ns�bCN��'[�m|Öw�؏N!ha�'�}����W�&5��e7S=�]}�)KwS��w�}��Y���p`ݵ�/�J�z����)W��q������T��6}Xgp^��a�� e���ACՒ��L�v�#�0�(�Y9}o��C�{qܭ�ax�=����;�t��j�?�轣�]jC�M���tb��/<��Q�/����먽j�3���pC����8vS����_Y���QM���h6���Å�򕳃��; �i=>onB1s�oq�9�f���8"����N�%X����b�=�piA'Ha��,��#�sm�d�R��5�M�
�]"�v��4�f���L<:��Zw���vk�`R�#.-�k�����Mt�]�Q�[�	��匤��,]�; K��%T�0/&���A�_�W�;�+f������%�߃�	�R��j����b�W�v��#,�p��"��[\�y��X�rT�a��ԑ�	�)6i�N�sIx���^o	�n��$�j�*j/�� �*�Gq�[�V���ǈ�*�V��S�Aa�V����24�,j�K�!���c܊O�Yҭ�+垭{D~4uæ��I��E�ei�e�A#�j܁�+awx���q|;�~���"��7��ej�/o��/�]3�;Ы#���������<2p%���P�C���ޑ��Ӳ�/����/�N캧/N�?��0'�R���i�=�B�;w}�3��]��7,9��S�����,So�$ѰK����*8*u�� XL7�Ğ9m��&Q�������^���X0$qs���n�*_��k �"�P���x=�f���M���Mw:����O$f��IҞ��ϥ��������$���#�M�X���ti��=�ٹ/ϯ�f�O���^���0T��ʋx^e���g��<	|Ţb�=ͭ֓?�T�}w�$�_����PGq���!�a^e����^�:��H��_r��.�r�����®{�#�nc~�M�h��(6��5&�������@wr��)˿Y#����`_�H
T,���;���S���6�Bҝ��	�D��`�b��%r/�u��l�^��te���96�˗�)��c".:���^Y��[i��J�3`7��Y��w�R�����i���~z����2�G�|l�w��Bq>o��_���ۋ�]V��� ����9
7Ǧ{��~���������Ӭ����?���ĽJ�7���"�;��m�?�q���z�?&P��8\�e"�P5�������믿��L9��           x�m�AN�0EדS�E�c�L]%(]�9SaiKN��a����p�vY�<��~!+�'�/�5N<a�m2�媐�\f�|����Eh�آ7�n�����l�ò�?�8 3\L%tZh�)�,�`���EX71TW�-Mv��}x�����5�ևܢ�1� ��X�q	e�]��y��ۀ����G҅�aO�%zj�
hi�#�FJ��N<�(^�O�Jh=���S
���ۯJ`<ϗDi���|"?�$�+�;��eY��3�e      
      x������ � �     